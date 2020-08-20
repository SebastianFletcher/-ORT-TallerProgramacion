{* Smarty *}

<!DOCTYPE html>

<html>
    <div id="divRegisterInstructor" class="container shadow p-3 mb-5 bg-white rounded" hidden>
        <h2>Alta de instructor</h2>
        
        <form  action="./DB/Queries/registerInstructor.php" method="POST">
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                <div class="col-sm-10"> 
                    <input type="text" class="form-control form-control-sm" name="name" aria-describedby="name" placeholder="Nombre" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="lastname" class="col-sm-2 col-form-label col-form-label-sm">Apellido</label>
                <div class="col-sm-10"> 
                    <input type="text" class="form-control form-control-sm" name="lastname" aria-describedby="lastname" placeholder="Apellido" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="document" class="col-sm-2 col-form-label col-form-label-sm">Cedula</label>
                <div class="col-sm-10"> 
                    <input type="text" class="form-control form-control-sm" name="document" aria-describedby="document" placeholder="Cedula" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="birthDate" class="col-sm-2 col-form-label col-form-label-sm">Fecha de nacimiento</label>
                <div class="col-sm-10"> 
                    <input type="date" class="form-control form-control-sm" name="birthDate" aria-describedby="birthDate" placeholder="Fecha de nacimiento" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="dueDate" class="col-sm-2 col-form-label col-form-label-sm">Fecha de vencimiento de libreta</label>
                <div class="col-sm-10"> 
                    <input type="date" class="form-control form-control-sm" name="dueDate" aria-describedby="dueDate" placeholder="Fecha de vencimiento de libreta" required>
                </div>
            </div>
            
            <div class="form-group">
                <input class="btn btn-outline-secondary col-sm-2" name="reset" type="reset" value="Limpiar" />
                <input class="btn btn-outline-success col-sm-2" name="register" type="submit" value="Registrar" />
            </div>

        </form>
    </div>
</html>