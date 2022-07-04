-- Consulta de usuarios y sus roles.
SELECT usuarios.idusuarios, roles.rol, usuarios.nombre, usuarios.email, usuarios.contrasena
FROM usuarios
INNER JOIN roles 
ON usuarios.roles_idroles = roles.idroles;

-- Consulta de los libros y su inventario.
SELECT inventario.cantidad, libros.titulo, libros.autor, libros.editorial, libros.ISBN, libros.descripcion, libros.precio
FROM libros
INNER JOIN inventario 
ON libros.idlibros = inventario.libros_idlibros;
