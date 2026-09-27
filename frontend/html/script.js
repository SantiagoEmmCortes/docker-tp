// URL relativa ("/api/..."), para que el navegador haga la peticion a Nginx (mismo origen que sirvió el HTML), y Nginx lo redirija al backend.
// Evita tener que lidiar con CORS entre orígenes distintos desde el punto de vista del navegador.
fetch("/api/usuarios/1")
  .then(res => {
    if (!res.ok) throw new Error("Error al consultar el backend");
    return res.json();
  })
  .then(data => {
    document.getElementById("mensaje").textContent =
      `¡Bienvenido, ${data.nombre}!`;
  })
  .catch(err => {
    document.getElementById("mensaje").textContent =
      "No se pudo cargar el usuario";
    console.error(err);
  });