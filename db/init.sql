
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO usuarios (nombre, email) VALUES
    ('Grupo 4', 'grupo4@utn.com'),
    ('Santiago', 'santiagocortes@gmail.com'),
    ('Ezequiel', 'ezequiel.alanis@hotmail.com'),
    ('Alejandro', 'ulisesgomez11478951@gmail.com'),
    ('Jorge', 'jorgeluiscabezas.f@gmail.com');
