

function confirmacionGuardarCliente() {
    if (confirm("¿Estás seguro de que deseas guardar este cliente?")) {
        alert("El cliente ha sido guardado exitosamente.");
    } else {
        alert("El cliente no ha sido guardado.");
    }
}