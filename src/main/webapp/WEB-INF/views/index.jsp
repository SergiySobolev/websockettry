<!DOCTYPE HTML>
<html lang="en">
<head>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css" />
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>
<body ng-app="chatApp">
<div ng-controller="ChatCtrl" class="container">
    <form ng-submit="addMessage()" name="messageForm">
        <input type="text" placeholder="Compose a new message..." ng-model="message" />
        <div class="info">
            <span class="count" ng-bind="max - message.length" ng-class="{danger: message.length > max}">140</span>
            <button ng-disabled="message.length > max || message.length === 0">Send</button>
        </div>
    </form>
    <hr />
    <p ng-repeat="message in messages | orderBy:'time':true" class="message">
        <time>{{message.time | date:'HH:mm'}}</time>
        <span ng-class="{self: message.self}">{{message.message}}</span>
    </p>
</div>

<script src="script/libs/sockjs/sockjs.js" type="text/javascript"></script>
<script src="script/libs/stomp-websocket/stomp.js" type="text/javascript"></script>
<script src="script/libs/angular/angular.js"></script>
<script src="script/libs/lodash/lodash.js"></script>
<script src="script/app/app.js" type="text/javascript"></script>
<script src="script/app/controllers.js" type="text/javascript"></script>
<script src="script/app/services.js" type="text/javascript"></script>
</body>
</html>