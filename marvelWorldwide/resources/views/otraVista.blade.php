<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<table class="table">
  <thead>
    <tr>
      <th scope="col">`usuEma11`</th>
      <th scope="col">`usuNombre1`</th>
      <th scope="col">`usuNombre2`</th>
      <th scope="col">`usuApell1`</th>
      <th scope="col">`usuApell2`</th>
      <th scope="col">`usuFechNac`</th>
      <th scope="col">`usuPassword`</th>
      <th scope="col">`usuUsername`</th>
      <th scope="col">`usuPais`</th>
      <th scope="col">`usuCiudad`</th>
    </tr>
  </thead>
  <tbody>
    @foreach ($datos as $item)
    <tr>
      <th> {{$item->usuEmail}}</th>
      <td>{{$item->usuNombre1}}</td>
      <td>{{$item->usuNombre2}}</td>
      <td>{{$item->usuApell1}}</td>
      <td>{{$item->usuApell2}}</td>
      <td>{{$item->usuFechNac}}</td>
      <td>{{$item->usuPassword}}</td>
      <td>{{$item->usuUsername}}</td>
      <td>{{$item->usuPais}}</td>
      <td>{{$item->usuCiudad}}</td>
    </tr>
    @endforeach
  </tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>