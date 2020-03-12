<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	TestJSON
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>TestJSON</h2>
    <div id="btnBar" >
        <button type="button" id="flickrBtn" >Flickr!</button> <br /><br /><br />
    </div>

    <div id="flicker">
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="jscriptContent" runat="server">
    <script type="text/javascript" src="/scripts/scrollsaver.min.js"></script>
<script type="text/javascript">
    $(function() {
        $.ajaxSetup({ "error": function(XMLHttpRequest, textStatus, errorThrown) {
            alert(textStatus);
            alert(errorThrown);
            alert(XMLHttpRequest.responseText);
        }
        });


        $('#flickrBtn').click(getJSONImg);
        //setInterval(imgRefresh, 3000);

    });

    function getJSONImg() {
        var url = "/Photo/GetJsonImage?PhotoID=290&Size=M";
        //var url = "/Home/GetCar";
        console.log('ha..');
        $.getJSON(url, function(d) {
            alert(d);
            $("<img />").attr('src', d.img).appendTo('#flicker');
        });

    }

    function getFlicker() {
        var url = "http://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?";
        $.getJSON(url, function(jsData) {
            console.log(jsData);
            var cats = jsData.items;
            $('#flicker').empty();
            $.each(cats, function(i, cat) {
                console.log(cat.title);
                $("<img />").attr('src', cat.media.m).appendTo('#flicker');
                if (i == 2) return false;
            });
        });
    }

    function imgRefresh() {
        var curImg = $('.currentPhoto');
        var nxtImg = $('.currentPhoto').next();

        if (nxtImg.length == 0) {
            nxtImg = $('#photoShow div').eq(0);
        }

        curImg.css('z-index', 0);
        nxtImg.css('z-index', 2);
        nxtImg.addClass('currentPhoto');
        nxtImg.css('opacity', 0.0);
        nxtImg.animate({ opacity: 1.0 }, 1500, 0, function() {
            curImg.removeClass('currentPhoto');
        });


    }
</script>

</asp:Content>
