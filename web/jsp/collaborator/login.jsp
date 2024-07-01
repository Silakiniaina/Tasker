<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/font.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/all.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <title>Login</title>
</head>

<body>
    <div class="container col-sm-12 login">
        <header class="row">
            <a href="#" class="col-sm-6 logo">logo</a>  
        </header>
        <main class="row">
            <div class="login__container col-md-7 left">
                <img src="assets/images/login.png" alt="">
            </div>
            <div class="login__container col-md-5 right">
                <form class="row g-3 needs-validation" novalidate action="login" method="post">
                    <div class="head">
                        <h2 class="title">Welcome back, Sanda</h2>
                        <p class="label">Welcom back, please enter your details.</p>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" name="email" class="form-control" id="floatingInput" placeholder="xyz@example.com" required>
                        <label for="floatingInput">Email address</label>
                        <div class="valid-feedback">Looks good!</div>
                    </div>
                    <div class="form-floating">
                        <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="********" required>
                        <label for="floatingPassword">Password</label>
                        <div class="valid-feedback">Looks good!</div>
                    </div>
                    <div class="row" id="form_link">
                        <div class="col form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                            <label class="form-check-label" for="invalidCheck">
                                Agree to terms and conditions
                            </label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>
                        <a href="#" class="col" style="text-align: right;">Forgot password?</a>
                    </div>
                    <button type="submit" class="btn btn-primary">Log In</button>
                </form>
            </div>
        </main>
    </div>
    <script>
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>