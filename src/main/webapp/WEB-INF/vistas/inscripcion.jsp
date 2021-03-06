<%@ include file="header.jsp" %>
	<main>
		<div class = "container">
			<h1 class="text-center">Inscripci&oacute;n a materias</h1>
			<div class="col-12">
            	<h3 class="text-center text-md-left text-dark mb-3"><i class="fas fa-graduation-cap"></i> Materias Disponibles</h3>
            	 <h5 class="text-danger" id="admin"></h5>
            	  <h5 class="text-success" id="enrolled"></h5>
            	<c:if test="${not empty subjects}">
            		<form action="validarInscripcion" method="POST" id="formularioInscripcion">
             		<div class="table-responsive">
                		<table class="table table-bordered" id="mydatatableSubject">
                    		<thead class="thead-dark">
                    			<tr>
                    				<th scope="col">Nombre</th>
                        			<th scope="col">Horario</th>
                        			<th scope="col">Turno</th>
                        			<th scope="col">Cupos</th>
                        			<th scope="col" class="text-center"><i class="fas fa-check-circle"></i></th>
                  				</tr>
                    		</thead>
                    		<tbody>
                    			<c:forEach items="${subjects}" var="subject">
                    			<c:if test="${subject.getCurrent_places() > 0}">
                        		<tr id="tr${subject.getId()}">
                        			<td><a href="/ChallengeAlkemy/materia/descripcion?id=${subject.getId()}">${subject.getName()}</a></td>
                            		<td>${subject.getStart_time()}:00 - ${subject.getFinish_time()}:00</td>
                            		<td>${subject.getShift()}</td>
                            		<td>${subject.getCurrent_places()}</td>
                            		<td>
                            			<div class="form-check text-center">
                            				<input class="form-check-input" type="checkbox" name="materiaAInscribirse" id="materiaAInscribirse${subject.getId()}" value="${subject.getId()}">
                                			<label class="form-check-label" for="materiaAInscribirse${subject.getId()}">
                                			</label>
                           				</div>
                            		</td>
                       			</tr>
                       			</c:if>
                        		</c:forEach>
                			</tbody>
                			<tfoot class="thead-dark">
                        	<tr>
                    			<th scope="col">Nombre</th>
                        			<th scope="col">Horario</th>
                        			<th scope="col">Turno</th>
                        			<th scope="col">Cupos</th>
                        			<th scope="col" class="text-center"><i class="fas fa-check-circle"></i></th>
                  			</tr>
                        </tfoot>
            			</table>
        			</div>
        			<div class="text-right">
        				<button type="submit" class="button btn-info">Inscribirse</button>
        			</div>
        			</form>
        		</c:if>
        		<c:if test="${empty subjects}">
        			<p>No se encuentran materias disponibles por el momento.</p>
        		</c:if>
       		</div>
		</div>
	</main>
<%@ include file="footer.jsp" %>