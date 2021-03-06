<#macro page title>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${title?html}</title>
    <link rel="stylesheet" href="/webjars/bootstrap/3.2.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjars/ekko-lightbox/4.0.2/dist/ekko-lightbox.min.css">
    <link rel="stylesheet" href="/css/kurento.css">
    <script src="/webjars/jquery/2.2.4/jquery.min.js"></script>
    <script src="/webjars/ekko-lightbox/4.0.2/dist/ekko-lightbox.min.js"></script>
    <script src="/webjars/draggabilly/2.1.0/draggabilly.pkgd.min.js"></script>
    <script src="/js/adapter.min.js"></script>
    <script src="/js/kurento-utils.min.js"></script>
</head>
<body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">
                    HeartBIT
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                <ul class="nav navbar-nav">
                    <#if currentUser??>
                    <li><a href="/user/${currentUser.id}">View myself</a></li>
                    </#if>

                    <#if currentUser?? && currentUser.role == "ADMIN">
                        <li><a href="/user/create">Create a new user</a></li>
                        <li><a href="/users">View all users</a></li>
                    </#if>
                </ul>

                <form id="logoutForm" action="/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                    <ul class="nav navbar-nav navbar-right">
                        <#if !currentUser??>
                            <li><a href="/login">Log in</a></li>
                        </#if>
                        <#if currentUser??>
                            <li onclick="logoutForm.submit();"><a href="#">Log out</a></li>
                        </#if>
                    </ul>
                </form>
            </div>
        </div>
    </nav>
    <!-- header section -->
    <div class="container">
        <div class="row">
            <div class="main-container">
                <#nested/>
            </div>
        </div>
    </div>
</body>
</html>

</#macro>