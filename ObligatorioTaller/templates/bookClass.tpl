{* Smarty *}

<!DOCTYPE html>

<html>
    <div class="container shadow p-3 mb-5 bg-white rounded" id="divBookClass" hidden>
        <h2>Reservar Clase</h2>

        <form method="POST" action="./DB/Queries/bookClass.php">

            <div class="form-group row">
                <label for="date" class="col-sm-2 col-form-label col-form-label-sm">Fecha</label>
                <div class="col-sm-10"> 
                    <input type="date" class="form-control form-control-sm" name="date" aria-describedby="date" placeholder="Fecha"  required>
                </div>
            </div>

            <div class="form-group row">
                <label for="time" class="col-sm-2 col-form-label col-form-label-sm">Horario</label>
                <div class="col-sm-10"> 
                    <select name="time" class="form-control form-control-sm" required>
                        <option value="7">7:00 - 8:00 hrs</option>
                        <option value="8">8:00 - 9:00 hrs</option>
                        <option value="9">9:00 - 10:00 hrs</option>
                        <option value="10">10:00 - 11:00 hrs</option>
                        <option value="11">11:00 - 12:00 hrs</option>
                        <option value="12">12:00 - 13:00 hrs</option>
                        <option value="13">13:00 - 14:00 hrs</option>
                        <option value="14">14:00 - 15:00 hrs</option>
                        <option value="15">15:00 - 16:00 hrs</option>
                        <option value="16">16:00 - 17:00 hrs</option>
                        <option value="17">17:00 - 18:00 hrs</option>
                        <option value="18">18:00 - 19:00 hrs</option>
                        <option value="19">19:00 - 20:00 hrs</option>
                        <option value="20">20:00 - 21:00 hrs</option>
                        <option value="21">21:00 - 22:00 hrs</option>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label for="instructor" class="col-sm-2 col-form-label col-form-label-sm">Instructor</label>
                <div class="col-sm-10"> 
                    <select name="instructor" class="form-control form-control-sm" required>
                        {foreach from=$allInstructors item=instructor}
                            <option value="{$instructor['instructor_id']}">{$instructor['nombre']} {$instructor['apellido']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>

            <div class="form-group">
                <input type="submit" value="Reservar" class="btn btn-outline-success col-sm-2" />
            </div>

        </form>
    </div>
</html>