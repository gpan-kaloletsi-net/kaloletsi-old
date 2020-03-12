using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using Z = gpp.Models;
using System.Linq;
using System.Data.Linq;

public partial class PhotoManager
{
   
    public static Stream ZGetPhoto(int photoid, PhotoSize size)
    {
        bool filter = !(HttpContext.Current.User.IsInRole("Friends") ||
                        HttpContext.Current.User.IsInRole("Administrators"));

        Z.PhotoDataContext photoDB = new Z.PhotoDataContext();
        Binary result = null;

        switch (size)
        {
            case PhotoSize.Small:
                result = photoDB.Photos
                                .Where(p => p.PhotoID == photoid)
                                .Where(p => p.Album.IsPublic == filter || p.Album.IsPublic == true)
                                .Select(p => p.BytesThumb).SingleOrDefault();
                break;

            case PhotoSize.Medium: 
                result = photoDB.Photos
                                .Where(p => p.PhotoID == photoid)
                                .Where(p => p.Album.IsPublic == filter || p.Album.IsPublic == true)
                                .Select(p => p.BytesPoster).SingleOrDefault();
                break;

            case PhotoSize.Large:
                result = photoDB.Photos
                                .Where(p => p.PhotoID == photoid)
                                .Where(p => p.Album.IsPublic == filter || p.Album.IsPublic == true)
                                .Select(p => p.BytesFull).SingleOrDefault();
                break;

            case PhotoSize.Original:
                result = photoDB.Photos
                                .Where(p => p.PhotoID == photoid)
                                .Where(p => p.Album.IsPublic == filter || p.Album.IsPublic == true)
                                .Select(p => p.BytesOriginal).SingleOrDefault();
                break;

        
        }
        try { return new MemoryStream(result.ToArray()); }
        catch { return null; }
    }


    public static List<Z.Photo> ZGetPhotos(int AlbumID)
    {
        bool filter = !(HttpContext.Current.User.IsInRole("Friends") ||
                        HttpContext.Current.User.IsInRole("Administrators"));

        var photoDB = new Z.PhotoDataContext();
        var qPhotos =
            photoDB
            .Photos
            .Where(p => p.AlbumID == AlbumID)
            .Where(p => p.Album.IsPublic == filter || p.Album.IsPublic == true)
            .Select(p => new {p.PhotoID, p.AlbumID, p.Caption });

        var photos = new List<Z.Photo>();
        foreach (var p in qPhotos)
        {
            photos.Add(new Z.Photo() {PhotoID=p.PhotoID, AlbumID=p.AlbumID, Caption=p.Caption });
        }

        return photos;
    }

    public static void ZAddPhoto(int _AlbumID, string _Caption, byte[] _BytesOriginal)
    {
        var photosDB = new Z.PhotoDataContext();
        var p = new Z.Photo() { AlbumID = _AlbumID, 
                                Caption =_Caption, 
                                BytesOriginal = _BytesOriginal ,
                                BytesFull = ResizeImageFile(_BytesOriginal, 600),
                                BytesPoster = ResizeImageFile(_BytesOriginal, 198),
                                BytesThumb = ResizeImageFile(_BytesOriginal, 100)
        };

        photosDB.Photos.InsertOnSubmit(p);
        photosDB.SubmitChanges();
    }
    
    public static void ZRemovePhoto(int _PhotoID)
    {
        var photoDB = new Z.PhotoDataContext();
        photoDB.ExecuteCommand("DELETE FROM [Photos] WHERE [PhotoID] = {0}", _PhotoID);

    }


    public static void ZAddAlbum(string _Caption, bool _IsPublic)
    {
        var photosDB = new Z.PhotoDataContext();
        var a = new Z.Album() {Caption = _Caption, IsPublic=_IsPublic };
        photosDB.Albums.InsertOnSubmit(a);
        photosDB.SubmitChanges();
    }

    public static void ZRemoveAlbum(int _AlbumID)
    {
        var photosDB = new Z.PhotoDataContext();
        var status = photosDB.RemoveAlbum(_AlbumID);
    }

    public static List<Z.Album> ZGetAlbums()
    {
        Z.PhotoDataContext photoDB = new Z.PhotoDataContext();
        bool filter = !((HttpContext.Current.User.IsInRole("Friends")
                    || HttpContext.Current.User.IsInRole("Administrators")));

        var qAlbums =
             photoDB
            .Albums
            .Where(a => a.IsPublic == filter || a.IsPublic == true)
            .Select(a => new { AlbumID = a.AlbumID, Caption = a.Caption, IsPublic = a.IsPublic, Count = a.Photos.Count() });

        List<Z.Album> albums = new List<Z.Album>();
        foreach (var x in qAlbums)
        {
            var a = new Z.Album() { AlbumID = x.AlbumID, Caption = x.Caption, IsPublic = x.IsPublic, Count = x.Count };
            albums.Add(a);
        }
        return albums;
    }

}