{* Smarty *}

<!DOCTYPE html>

<html>
    <div class="container shadow p-3 mb-5 bg-white rounded" id="divApproveClient" hidden>
        <h2>Usuarios inscriptos para clase de manejo</h2>

        <form method="POST" action="./DB/Queries/approveUser.php">
            <ul id="ulClients" class="list-group">
                {foreach from=$pendingClients item=client}
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
            <div class="form-group">
                <input type="submit" value="Aprobar clientes" class="btn btn-outline-success col-sm-2" />
            </div>
        </form>
    </div>
</html>