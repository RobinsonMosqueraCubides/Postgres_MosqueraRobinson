ALTER TABLE municipios
ADD COLUMN conteo_personas_viven INT DEFAULT 0,
ADD COLUMN conteo_personas_trabajan INT DEFAULT 0;

CREATE OR REPLACE FUNCTION actualizar_conteos_municipios()
RETURNS TRIGGER AS $$
BEGIN
    -- Actualiza el conteo de personas que viven en el municipio de domicilio
    IF TG_OP = 'INSERT' THEN
        UPDATE municipios
        SET conteo_personas_viven = conteo_personas_viven + 1
        WHERE id = NEW.municipio_domicilio_id;

        UPDATE municipios
        SET conteo_personas_viven = conteo_personas_viven + 1
        WHERE id = NEW.municipio_nacimiento_id;
        
    ELSIF TG_OP = 'UPDATE' THEN
        -- Si el municipio de domicilio cambia, decrementar del antiguo y sumar al nuevo
        IF OLD.municipio_domicilio_id IS DISTINCT FROM NEW.municipio_domicilio_id THEN
            UPDATE municipios
            SET conteo_personas_viven = conteo_personas_viven - 1
            WHERE id = OLD.municipio_domicilio_id;

            UPDATE municipios
            SET conteo_personas_viven = conteo_personas_viven + 1
            WHERE id = NEW.municipio_domicilio_id;
        END IF;

        -- Si el municipio de nacimiento cambia, decrementar del antiguo y sumar al nuevo
        IF OLD.municipio_nacimiento_id IS DISTINCT FROM NEW.municipio_nacimiento_id THEN
            UPDATE municipios
            SET conteo_personas_viven = conteo_personas_viven - 1
            WHERE id = OLD.municipio_nacimiento_id;

            UPDATE municipios
            SET conteo_personas_viven = conteo_personas_viven + 1
            WHERE id = NEW.municipio_nacimiento_id;
        END IF;

    ELSIF TG_OP = 'DELETE' THEN
        -- Disminuye el conteo de los municipios afectados
        UPDATE municipios
        SET conteo_personas_viven = conteo_personas_viven - 1
        WHERE id = OLD.municipio_domicilio_id;

        UPDATE municipios
        SET conteo_personas_viven = conteo_personas_viven - 1
        WHERE id = OLD.municipio_nacimiento_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_actualizar_conteos
AFTER INSERT OR UPDATE OR DELETE ON personas
FOR EACH ROW
EXECUTE FUNCTION actualizar_conteos_municipios();

