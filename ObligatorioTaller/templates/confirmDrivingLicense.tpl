{* Smarty *}

<!DOCTYPE html>

<html>
    <div class="container shadow p-3 mb-5 bg-white rounded" id="divConfirmDrivingLic" hidden>
        <h2>Usuarios con mas de 15 clases</h2>
        
            <form method="POST" action="./DB/Queries/confirmLicense.php">
                <ul id="ulClients" class="list-group">
                    {foreach from=$pendingLicences item=client}
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <input name="document" type="radio" value="{$client['ci']}">
                                </div>
                            </div>
                            <div class="form-control" style="height: auto;">
                                <label class="col-sm-2 col-form-label col-form-label-sm">CI</label>
                                <label class="col-sm-5 col-form-label col-form-label-sm">{$client['ci']}</label>
                                <br>
                                <label class="col-sm-2 col-form-label col-form-label-sm">Nombre</label>
                                <label class="col-sm-5 col-form-label col-form-label-sm">{$client['nombre']} {$client['apellido']}</label>
                            </div>
                        </div>
                    {/foreach}
                </ul> 
                <input type="submit" value="Confirmar libretas" class="btn btn-outline-success col-sm-2"/>
            </form>
    </div>
</html>

