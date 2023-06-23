<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Documciwent</title>
</head>
<body>
    {{-- <div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Email address</label>
  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
</div> --}}
    <form action="/register" method="POST">
      @csrf
      <input name="usuEmail" type="email" placeholder="email">
      <input name="usuNombre1" type="text" placeholder="primer nombre">
      <input name="usuNombre2" type="text" placeholder="segundo nombre">
      <input name="usuApell1" type="text" placeholder="primer apellido">
      <input name="usuApell2" type="text" placeholder="segundo apellido">
      <input name="usuFechNac" type="date" placeholder="fecha de nacimiento">
      <input name="usuPassword" type="password" placeholder="contraseña">
      <input name="usuUsername" type="text" placeholder="usuario">
      <input name="usuPais" type="text" placeholder="país">
      <input name="usuCiudad" type="text" placeholder="ciudad">
      <button>Register</button>
    </form>
</body>
</html>
