$(document).ready(function() {

	var offset = $(document).height() * 0.021;

$('.navbar li a').click(function(event) {
    event.preventDefault();
    $($(this).attr('href'))[0].scrollIntoView();
    scrollBy(0, -offset);
});
$('.of-produkt').click(function(event) {
    location.href = $(this).attr('name');
});
$( window ).resize(function() {
  offset = $(document).height() * 0.021;
});
loadMap();
});


function linkKlik()
{
	 $('.navbar-collapse').collapse('hide');
	 $('#scrollspy-nav').removeClass('active');
	}
function send() {
		if (checkIfDisabled())
		{
			document.getElementById('message').submit();
		}
	}
    function checkImie() {
        if ($("#imie").val().length > 0)
        {
             $("#imie").removeClass("form-control-warning");
             $("#imieDiv").removeClass("has-warning");
             $("#imie").addClass("form-control-success");
             $("#imieDiv").addClass("has-success");
             return true;
        }
        else
        {
            $("#imie").removeClass("form-control-success");
            $("#imieDiv").removeClass("has-success");
            $("#imie").addClass("form-control-warning");
            $("#imieDiv").addClass("has-warning");
            return false;
        }
    }
    function checkEmail() {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (regex.test($("#email").val()))
            {
                 $("#email").removeClass("form-control-warning");
                 $("#emailDiv").removeClass("has-warning");
                 $("#email").addClass("form-control-success");
                 $("#emailDiv").addClass("has-success");

                return true;
            }
            else
            {
                $("#email").removeClass("form-control-success");
                $("#emailDiv").removeClass("has-success");
                $("#email").addClass("form-control-warning");
                $("#emailDiv").addClass("has-warning");
                return false;
            }
    }
    function checkText() {
        if ($("#text").val().length > 1)
            {
                return true;
            }
        else
            return false;
    }
    function chcekBeforeSubmit() {
       if (checkImie() && checkEmail() && checkText())
           {
               $("#sub").removeClass("disabled");
               return true;
           }

        else
            {
                $("#sub").addClass("disabled");
                return false;
            }
    }
    function checkIfDisabled()
    {
    	if (checkImie() && checkEmail() && checkText())
            return true;
    	else
            return false;
    }
    function navchg()
    {
    	if ($("#scrollspy-nav").hasClass("active"))
    		$("#scrollspy-nav").removeClass("active");
    	else
    		$("#scrollspy-nav").addClass("active");
    }
		function loadMap() {
			var latlng = new google.maps.LatLng(53.45907829999999,
					17.538740200000007);
			var myOptions = {
				zoom : 15,
				center : latlng,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("mapa"),
					myOptions);

			var marker = new google.maps.Marker({
				position : latlng,
				map : map,
				title : "Sigma Sławomir Strawa"
			});

		}
