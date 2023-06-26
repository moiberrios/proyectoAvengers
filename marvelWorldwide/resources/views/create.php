<?php
			// require_once("models/models_create.php");
			?>
				
			<div class="row">
				<form method="post">
				<div class="col-md-6">
					<label>Nombre:</label>
					<input type="text" name="nombre" id="nombre" class='form-control' maxlength="100" required >
				</div>
				<div class="col-md-6">
					<label>Ingrendiente Principal:</label>
					<input type="text" name="ingrendiente_principal" id="ingrendiente_principal" class='form-control' maxlength="100" required>
				</div>
				<div class="col-md-6">
					<label>Bebida:</label>
                    <input type="text" name="bebida" id="bebida" class='form-control' maxlength="15" required >
					
				</div>
				<div class="col-md-6">
					<label>Descripcion:</label>
					<input type="text" name="descripcion" id="descripcion" class='form-control' maxlength="15" required >
				</div>
				<div class="col-md-6">
					<label>Fecha Creacion:</label>
					<input type="text" name="fecha_creacion" id="fecha_creacion" class='form-control' maxlength="64" required>
				
				</div>

                <div class="col-md-6">
					<label>Fecha Actualizada:</label>
					<input type="text" name="fecha_actualizada" id="fecha_actualizada" class='form-control' maxlength="64" required>
				
				</div>
				
				<div class="col-md-12 pull-right">
				<hr>
					<button type="submit" class="btn btn-success">Guardar datos</button>
				</div>
				</form>
			</div