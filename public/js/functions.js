function checar(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    if (tecla == 8)
        return true;
    patron = /[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}

function validate(name_form, arreglo, span_id) {
    var array = new Array(arreglo.length);
    var array_getelm = new Array(arreglo.length);

    for (var i = 0; i < arreglo.length; i++) {
        array[i] = document.forms[name_form][arreglo[i]];
        array_getelm[i] = document.getElementById(arreglo[i]);
    }

    for (var i = 0; i < array.length; i++) {
        if (array[i].value == "") {
            array[i].focus();
            var texto = "<FONT size='1'>¡Todos los campos deben estar llenos!</FONT>";
            document.getElementById(span_id).innerHTML = texto;
            return false;
        }
    }
    return true;
}

