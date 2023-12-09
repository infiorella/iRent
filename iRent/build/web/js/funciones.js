        
                $(document).ready(function(){
            $("#datatable").DataTable({
                "bLengthChange": false,
                language: {                
                    "lengthMenu": "Mostrar _MENU_ registros",                
                    "zeroRecords": "No se encontraron resultados",                
                    "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",                
                    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",             
                    "sSearch": "Buscar:",                
                    "oPaginate": {                    
                        "sFirst": "Primero",                    
                        "sLast":"%C3%9Altimo",                    
                        "sNext":"Siguiente",                    
                        "sPrevious": "Anterior"     
                    },     
                    "sProcessing":"Procesando...",            
                },
        
                //para usar los botones responsive: 
                responsive: "true",        
                dom: 'Bfrtilp',               
                buttons:[ 
                    {
                        extend:    'excelHtml5',
                        text:      '<i class="fas fa-file-excel"> Excel </i> ',
                        titleAttr: 'Exportar a Excel',
                        className: 'btn btn-success'
                    },
                    {
                        extend:    'pdfHtml5',
                        text:      '<i class="fas fa-file-pdf"> PDF </i> ',
                        titleAttr: 'Exportar a PDF',
                        className: 'btn btn-danger'
                    },
                    {
                        extend:    'print',
                        text:      '<i class="fa fa-print"> Imprimir </i> ',
                        titleAttr: 'Imprimir',
                        className: 'btn btn-info'
                    },
                ]            
            });     
        });
        
        //buscar
        $(document).ready(function() {
    // Setup - add a text input to each footer cell
    $('#datatable').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Buscar '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#datatable').DataTable({
        initComplete: function () {
            // Apply the search
            this.api().columns().every( function () {
                var that = this;
 
                $( 'input', this.footer() ).on( 'keyup change clear', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );
        }
    });
 
} );
        