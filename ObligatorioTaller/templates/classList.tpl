{* Smarty *}

<!DOCTYPE html>

<html>
    <div class="container shadow p-3 mb-5 bg-white rounded" id="divClassList" hidden>
        <script>
            function myFunction() {
                var dateSelected = document.getElementById('dateSelected').value;
                var input = document.getElementById('instructorSelector');
                var instructor = input.options[input.selectedIndex].value;

                var li = document.getElementById('ulClases').getElementsByTagName('li');

                for (i = 0; i < li.length; i++) {

                    var allLabel = li[i].getElementsByTagName("label");

                    var fechaValue = allLabel[1].textContent;
                    var instructorValue = allLabel[7].textContent;

                    if (instructorValue == instructor && fechaValue == dateSelected) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }

            function cleanFilter() {
                var li = document.getElementById("ulClases").getElementsByTagName('li');

                for (i = 0; i < li.length; i++) {
                    li[i].style.display = "";
                }
            }

            function generatePDF() {
                var doc = new jsPDF('portrait');
                var verticalOffset = 20;

                doc.text(20, verticalOffset, 'Listado de clases');
                verticalOffset += 10;

                if (document.getElementById('instructorSelector').selectedIndex >= 0) {
                    var input = document.getElementById('instructorSelector');
                    var dateSelected = document.getElementById('dateSelected').value;
                    var instructor = input.options[input.selectedIndex].value;

                    var li = document.getElementById("ulClases").getElementsByTagName('li');

                    doc.setFontSize(12);

                    // Loop through all list items, and hide those who don't match the search query
                    for (i = 0; i < li.length; i++) {
                        var allLabel = li[i].getElementsByTagName("label");

                        var fechaValue = allLabel[1].textContent;
                        var horaValue = allLabel[4].textContent;
                        var instructorValue = allLabel[7].textContent;
                        var usuarioValue = allLabel[10].textContent + ' ' + allLabel[11].textContent ;
                        var direccionValue = allLabel[13].textContent;

                        if (instructorValue == instructor && fechaValue == dateSelected) {
                            doc.text(20, verticalOffset, 'Fecha: ' + fechaValue + ' Turno: ' + horaValue + ' - Instructor: ' + instructorValue);
                            verticalOffset += 6;
                            doc.text(20, verticalOffset, 'Usuario: ' + usuarioValue);
                            verticalOffset += 6;
                            doc.text(20, verticalOffset, 'Direccion: ' + direccionValue);
                        } else if (li[i].style.display == "") {
                            doc.text(20, verticalOffset, 'Fecha: ' + fechaValue + ' ' + horaValue + ' - Instructor: ' + instructorValue);
                            verticalOffset += 6;
                            doc.text(20, verticalOffset, 'Usuario: ' + usuarioValue);
                            verticalOffset += 6;
                            doc.text(20, verticalOffset, 'Direccion: ' + direccionValue);
                        }

                        verticalOffset += 10;
                    }
                }

                doc.save('listadoClases.pdf');
            }

            Date.prototype.toDateInputValue = (function () {
                var local = new Date(this);
                local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
                return local.toJSON().slice(0, 10);
            });
        </script>

        <h2>Listado de clases por instructor</h2>

        <div id="divInstructores">
            <div class="form-group row">
                <label for="instructor" class="col-sm-2 col-form-label col-form-label-sm">Instructor</label>
                <div class="col-sm-10"> 
                    <select name="instructor" id="instructorSelector" class="form-control form-control-sm" required>
                        {foreach from=$allInstructors item=instructor}
                            <option value="{$instructor['instructor_id']}" >{$instructor['nombre']} {$instructor['apellido']}</option>
                        {/foreach}
                    </select>
                </div>
            </div> 
            <div class="form-group row">
                <label class="col-sm-2 col-form-label col-form-label-sm">Fecha</label>
                <div class="col-sm-10"> 
                    <input type="date" id="dateSelected" name="formBirthdate" class="form-control validate" required>
                </div>
            </div>
            <div class="form-group">
                <input type="button" value="Aplicar filtro" onclick="myFunction()" class="btn btn-outline-success col-sm-2" />
                <input type="button" value="Exportar lista a PDF" onclick="generatePDF()" class="btn btn-outline-info col-sm-2" />
            </div>
        </div>

        <div id="divClasesInstructor">
            <h3>Listado de Clases</h3>

            <ul id="ulClases" class="list-group">
                {foreach from=$clasesUsuarios item=clase}
                    <li class="input-group mb-3" id="liClase">
                        <div class="input-group mb-3">
                            <label class="col-sm-2 col-form-label col-form-label-sm">Fecha</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm">{$clase['fecha']}</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm"></label>
                            <br>
                            <label class="col-sm-2 col-form-label col-form-label-sm">Turno</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm">{$clase['hora']}</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm"></label>
                            <br>
                            <label class="col-sm-2 col-form-label col-form-label-sm">Id Instructor</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm">{$clase['instructor_id']}</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm"></label>
                            <br>
                            <label class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm">{$clase['nombre']}</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm">{$clase['apellido']}</label>
                            <br>
                            <label class="col-sm-2 col-form-label col-form-label-sm">Direccion</label>
                            <label class="col-sm-5 col-form-label col-form-label-sm">{$clase['direccion']} </label>
                            <label class="col-sm-5 col-form-label col-form-label-sm"></label>
                        </div>
                    </li> 
                {/foreach}
            </ul> 
        </div>

    </div>
</html>
