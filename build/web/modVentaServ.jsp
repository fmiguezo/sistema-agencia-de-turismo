<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Cliente, Logica.Empleado, Logica.ServicioTuristico, Logica.PaqueteTuristico, Logica.Venta, Logica.Controladora, java.text.SimpleDateFormat, java.util.Date, java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Agencia Skydash - Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
</head>

<body>
    <%HttpSession misession = request.getSession();
    String usuario = (String) misession.getAttribute("usuario");
        if (usuario == null){
            response.sendRedirect("login.jsp");
        } 
    %>
  <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.jsp"><img src="images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Búsqueda" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Configuración</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Mensaje Privado
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">Registro de nuevo usuario</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown"> 
            <a class="nav-link dropdown-toggle" href="#updatepassword" data-toggle="dropdown" id="profileDropdown">
              <form id="form-logout" action="SvModificarUsu" method="POST">
                    <input type="hidden" name="nombre_usuario" value="<%=usuario%>">
                    <button type="submit" class="btn btn-inverse-primary btn-fw"><i class="ti-reload btn-icon-prepend"></i> Cambiar contraseña</button>
              </form>
            </a>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <form id="form-logout" action="SvLogout" method="GET">
                    <input type="hidden" name="logout" value="true">
                    <button type="submit" class="btn btn-inverse-primary btn-fw"><i class="ti-power-off btn-icon-prepend"></i> Cerrar sesión</button>
              </form>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">MODO VISTA</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Claro</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Oscuro</div>
          <p class="settings-heading mt-2">COLOR ENCABEZADO</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#servicios" aria-expanded="false" aria-controls="servicios">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">Servicios</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="servicios">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaServicios.jsp">Alta de servicios</a></li>
                <form action="SvConsultaSer" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaSer">Lista de servicios </a></li>
                </form>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#paquetes" aria-expanded="false" aria-controls="paquetes">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">Paquetes</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="paquetes">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaPaquetes.jsp">Alta de paquetes</a></li>
                <form action="SvConsultaPaq" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaPaq">Lista de paquetes</a></li>
                </form>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ventas" aria-expanded="false" aria-controls="ventas">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">Ventas</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ventas">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaVentasSer.jsp">Vender servicio</a></li>
                <li class="nav-item"> <a class="nav-link" href="altaVentasPaq.jsp">Vender paquete</a></li>
                <form action="SvConsultaVen" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaVen">Lista de ventas</a></li>
                </form>
              </ul>
            </div>
          </li>   
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#empleados" aria-expanded="false" aria-controls="empleados">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Empleados</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="empleados">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaEmpleados.jsp"> Alta de empleados </a></li>
                <form action="SvConsultaEm" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaEm"> Lista de empleados </a></li>
                </form>
              </ul>
            </div>
          </li>
        
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#clientes" aria-expanded="false" aria-controls="clientes">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Clientes</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="clientes">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="altaClientes.jsp"> Alta de clientes </a></li>
                <form action="SvConsultaCl" method="GET">
                    <li class="nav-item"> <a class="nav-link" href="SvConsultaCl"> Lista de clientes </a></li>
                </form>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
      
    <!-- partial -->  
    <div class="main-panel">
      <div class="content-wrapper d-flex align-items-center empleados px-0">
        <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <div class="brand-logo">
                        <img src="images/logo.svg" alt="logo">
                    </div>
                  <h4 class="card-title">Modificación de ventas de servicios</h4>
                  <h5 class="font-weight-light">Ingrese los datos de la venta</h5><br>
                  <form class="forms-sample" action="SvModificarVen" method="GET" id="formulario">
                    <% Controladora control = new Controladora();
                    Venta venta = (Venta) request.getSession().getAttribute("venta");
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                    Date fecha_venta = venta.getFecha_venta();
                    String strDate = formatter.format(fecha_venta);
                    String medio_pago = venta.getMedio_pago();
                    Cliente cliente = venta.getCliente();
                    Empleado empleado = venta.getEmpleado();
                    ServicioTuristico servicio = venta.getServicio();
                    %>
                    <div class="form-group">
                      <div class="form-group">
                       <label for="fecha_venta">Fecha de venta</label>
                       <input type="date" class="form-control" id="fecha_venta" name="fecha_venta" value="<%=strDate%>" required>
                      </div>
                      <label for="medio_pago">Medio de pago</label>
                      <select class="form-control" id="medio_pago" name="medio_pago" value="<%=medio_pago%>" required>
                          <option <%if (medio_pago.equals("Efectivo")) { %> selected="selected" <%};%>>Efectivo</option>
                          <option <%if (medio_pago.equals("Tarjeta de débito")) { %> selected="selected" <%};%>>Tarjeta de débito</option>
                          <option <%if (medio_pago.equals("Tarjeta de crédito")) { %> selected="selected" <%};%>>Tarjeta de crédito</option>
                          <option <%if (medio_pago.equals("Monedero virtual")) { %> selected="selected" <%};%>>Monedero virtual</option>
                          <option <%if (medio_pago.equals("Transferencia")) { %> selected="selected" <%};%>>Transferencia</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="cliente">Cliente</label>
                      <select class="form-control" id="cliente" name="cliente" required>
                          <option disabled selected value></option>
                        <% List<Cliente> listaClientes = control.traerClientes();
                           for (Cliente clie : listaClientes) {
                        %>                
                        <option value="<%=clie.getId()%>" <%=(clie.getId() == cliente.getId()) ? "selected" : ""%>>
                            <%=clie.getNombre()%> <%=clie.getApellido()%> - DNI <%=clie.getDni()%>
                        </option>
                        <%}%>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="empleado">Empleado</label>
                      <select class="form-control" id="empleado" name="empleado" required>
                          <option disabled selected value></option>
                          <% List<Empleado> listaEmpleados = control.traerEmpleados();
                           for (Empleado emple : listaEmpleados) {
                        %>
                        <option value="<%=emple.getId()%>" <%=(emple.getId() == empleado.getId()) ? "selected" : ""%>>
                            <%=emple.getNombre()%> <%=emple.getApellido()%> - DNI <%=emple.getDni()%>
                        </option>
                        <%}%>
                      </select>
                    </div>
                        <div class="form-group">
                      <label for="servicio">Servicio</label>
                      <select class="form-control" id="servicio" name="servicio">
                          <option selected value></option>
                          <% List<ServicioTuristico> listaServicios = control.traerServicios();
                           for (ServicioTuristico serv : listaServicios) {
                        %>
                        <option value="<%=serv.getCodigo_servicio()%>" <%=(serv.getCodigo_servicio() == servicio.getCodigo_servicio()) ? "selected" : ""%>>
                            <%=serv.getCodigo_servicio()%>: <%=serv.getNombre()%> - <%=serv.getTipo_servicio()%> - <%=serv.getCosto_servicio()%>
                        </option>
                        <%}%>
                      </select>
                      <input type="hidden" name="num_venta" value="<%=venta.getNum_venta()%>">
                    </div>
                    <button type="submit" class="btn btn-primary mr-2" value="enviar" id="btn-enviar">Modificar venta</button>
                  </form>
                </div>
              </div>
            </div>  
      </div>
      <!-- content-wrapper ends -->
      <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Sitio web elaborado con <i class="ti-heart text-danger ml-1"></i> por <a href="https://github.com/florfmo" target="_blank">Florencia Miguez</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
          </div>
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a></span> 
          </div>
        </footer> 
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>