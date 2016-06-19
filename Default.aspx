<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="gmap._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


<head id="Head1">
    <title></title>


<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>


    <script type="text/javascript">
        var map;

        function CreateMarker() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/BindMapMarker",
                data: "{}",
                dataType: "json",
                success: function (data) 
                {
                    var myOptions = {
                        center: new google.maps.LatLng(data.d[0].Latitude, data.d[0].Longitude),
                        zoom: 14,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("idgoogleMap"), myOptions);

                    var ltlng = [];

                    for (var i = 0; i <= data.d.length; i++) {

                        ltlng.push(new google.maps.LatLng(data.d[i].Latitude, data.d[i].Longitude));

                        marker = new google.maps.Marker({
                            map: map,
                            animation: google.maps.Animation.DROP,
                            icon: '3.png',
                            title: data.d[i].LocationName,
                            position: ltlng[i]
                        });


                        (function (marker, i) {

                            google.maps.event.addListener(marker, 'click', function () {

                                infowindow = new google.maps.InfoWindow({ maxWidth: 250 });
                                infowindow.setContent(data.d[i].LocationName);
                                infowindow.open(map, marker);

                            });

                        })(marker, i);


                    }




                },
                error: function (result) {
                    alert("Error");
                }
            });


            
        };


        //google.maps.event.addDomListener(window, 'load', CreateMarker());


    </script>


</head>




<body>

    <div>
    
    <table width="100%">
        <tr>
            <td>
                <div id="idgoogleMap" style="width: 925px; height: 600px" />
            </td>
        </tr>
    </table>

    </div>

</body>







</asp:Content>
