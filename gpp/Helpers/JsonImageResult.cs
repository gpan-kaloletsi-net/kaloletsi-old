using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using System.Web;
using System;
using System.Web.Mvc;
public class JsonImageResult : JsonResult
{

    public JsonImageResult()
    {
    }

    public override void ExecuteResult(ControllerContext context)
    {
        GetJsonImage(context);
    }

    private void GetJsonImage(ControllerContext context)
    {
    	// Set up the response settings
        var response = context.RequestContext.HttpContext.Response;
        var request = context.RequestContext.HttpContext.Request;

        response.ContentType = "application/json";
		response.Cache.SetCacheability(HttpCacheability.Public);
		response.BufferOutput = false;
		// Setup the Size Parameter
		PhotoSize size;
		switch (request.QueryString["Size"]) {
			case "S":
				size = PhotoSize.Small;
				break;
			case "M":
				size = PhotoSize.Medium;
				break;
			case "L":
				size = PhotoSize.Large;
				break;
			default:
				size = PhotoSize.Original;
				break;
		} 
		// Setup the PhotoID Parameter
		Int32 id = -1;
		Stream stream = null;
		if (request.QueryString["PhotoID"] != null && request.QueryString["PhotoID"] != "") {
			id = Convert.ToInt32(request.QueryString["PhotoID"]);
			stream = PhotoManager.GetPhoto(id, size);
		} else {
			id = Convert.ToInt32(request.QueryString["AlbumID"]);
			stream = PhotoManager.GetFirstPhoto(id, size);
		}
		// Get the photo from the database, if nothing is returned, get the default "placeholder" photo
		if (stream == null) stream = PhotoManager.GetPhoto(size);

        
        
		// Write image stream to the response stream
		byte[] buffer = new byte[stream.Length];
        int count = stream.Read(buffer, 0, buffer.Length);
        //string jsonImg = Convert.ToBase64String(buffer);
        
        string jsonImg = "({\"img\":" + 
                        "\"data:image/png;base64," + 
                        Convert.ToBase64String(buffer) +
                        "\"})";
        
        response.Write(jsonImg);        
	}

    
}