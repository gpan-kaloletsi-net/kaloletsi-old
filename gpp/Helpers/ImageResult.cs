using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using System.Web;
using System;
using System.Web.Mvc;
public class ImageResult : ActionResult
{

    public ImageResult()
    {
        
    }

    public override void ExecuteResult(ControllerContext context)
    {
        GetImage(context);
    }

    private void GetImage(ControllerContext context)
    {
    	// Set up the response settings
        var response = context.RequestContext.HttpContext.Response;
        var request = context.RequestContext.HttpContext.Request;

        response.ContentType = "image/jpeg";
        //response.AddHeader("content-disposition", "attachment; filename=hip.jpg");
		response.Cache.SetCacheability(HttpCacheability.Public);

		response.BufferOutput = false; //Send in chunks
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
		const int buffersize = 1024 * 16;
		byte[] buffer = new byte[buffersize];
		int count = stream.Read(buffer, 0, buffersize);
        while (count > 0)
        {
            response.OutputStream.Write(buffer, 0, count);
            count = stream.Read(buffer, 0, buffersize);
        }
        
	}

    
}