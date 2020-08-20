{* Smarty *}

<!DOCTYPE html>

<html>
    <head> 

        <script>

            function procesoResultado(datos) {
                if (datos["status"] == "OK") {
                    var data = datos["data"];
                } else {
                    alert("Error al cosultar las reservas")
                }
            }

            document.addEventListener('DOMContentLoaded', function () {

                var calendar = new FullCalendar.Calendar(document.getElementById('calendar'), {
                    editable: false,
                    selectable: false,
                    businessHours: true,
                    dayMaxEvents: true,
                    aspectRatio: 2,
                    events: function (fetchInfo, successCallback, failureCallback) {
                        jQuery.ajax({
                            url: "./DB/Queries/informationGet.php",
                            type: "POST",
                            dataType: "JSON",
                            success: function (data) {
                                var events = [];
                                if (!!data.data) {
                                    var i = 0;
                                    $.map(data.data, function (r) {
                                        var event = {
                                            id: i,
                                            start: r.fecha,
                                            end: r.fecha
                                        };
                                        if (((data.instructores.total * 15) / 2) > r.total) {
                                            event.title = "Cupos disponibles.";
                                            event.color = "#64ff3e";
                                        } else if ((data.instructores.total * 15) == r.total) {
                                            event.title = "Dia completo.";
                                            event.color = "red";
                                        } else {
                                            event.title = "Pocos cupos disponibles.";
                                            event.color = "#fff93a";
                                        }
                                        events.push(event);
                                        i++;
                                    });
                                }
                                successCallback(events);
                            },
                            error: function (error) {
                                failureCallback();
                            }
                        });
                    }
                });
                calendar.updateSize();
                calendar.render();
            });
        </script>
        
    </head>
    <div id="divInfoMainPage" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators">
            <li data-target="#divInfoMainPage" data-slide-to="0" ></li>
            <li data-target="#divInfoMainPage" data-slide-to="1" class="active"></li>
            <li data-target="#divInfoMainPage" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner">

            <div class="carousel-item ">
                <img class="d-block mx-auto" width="70%" src="./imgs/wallpapers/wall1.jpg" alt="Class costs">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="text-white bg-dark"> Usuarios Inscriptos :  {$registerUsers} </h3> 
                    <h3 class="text-white bg-dark"> Usuarios Aprobados :  {$approvedUsers} </h3> 
                </div>
            </div>
            <div class="carousel-item active" >
                <div id='calendar' width="70%">
                </div>
            </div>

            <div class="carousel-item">
                <img class="d-block mx-auto" width="64%" src="./imgs/wallpapers/wall2.jpg" alt="Costo de Clases">
                <div class="carousel-caption d-none d-md-block">
                    <h3 class="text-white bg-dark"> Costo de las Clases :  $1.500 </h3> 
                </div>
            </div>
        </div>
    </div>
</html>