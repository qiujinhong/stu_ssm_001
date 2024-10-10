<html>
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<body>
<h2>Hello World!</h2>

<input type="submit" id="btn">


<script>
    $("#btn").click(function (){
        $.get("book/findBook",{id:"1"},function (book){
            console.log(book)
        })
    })

</script>
</body>
</html>
