using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Reflection;
using System.Windows.Markup;
using System.Windows.Browser;

namespace PythSlv
{
    public partial class MainPage : UserControl
    {
        int step = 0;
        Path yP;
        Path gP;
        Path bP;
        Path rP;

        Path y2P;
        Path g2P;
        Path b2P;
        Path r2P;

        public MainPage()
        {
            
            InitializeComponent();
            //HtmlPage.Window.AttachEvent("onresize", new EventHandler<HtmlEventArgs>(OnResizeHandler));
            
        }

        private void OnResizeHandler(object sender, HtmlEventArgs args)
        {
            double h = this.Height;
            double w = this.Width;

            double tH = App.Current.Host.Content.ActualHeight;
            double tW = App.Current.Host.Content.ActualWidth;

            double scale = Math.Min(tH / h, tW / w);



            canvasTransform.ScaleX = scale;
            canvasTransform.ScaleY = scale;
        
        }

        private void Nxt_Click(object sender, RoutedEventArgs e)
        {
            
            step++;
            if (step > 8)
            {
                step = 8;
                return;
            }

            if (step < 5) UpperNext();
            if (step > 4) BottomNext();
        }

        private void UpperNext()
        {
            Path p = null;
            switch (step)
            {
                case 1: //200,200 100,200 200,300
                    yP = oPath(200, 150, 100, 150, 200, 250, Colors.Yellow);
                    break;
                case 2: //"M200,200 L100,200 L250,300Z"
                    /*
                    theCanvas.Children.Remove(yP);
                    gP = oPath(200, 150, 100, 150, 250, 250, Colors.Green);
                    */

                    nxtBtn.IsEnabled = false;
                    prvBtn.IsEnabled = false;
                    yP.Name = "yTriangle";                    
                    Storyboard.SetTargetName(movePoint, yP.Name);
                    movePoint.Begin();
                    break;
                case 3: //"M200,200 L200,300 L300,150Z"
                    //theCanvas.Children.Remove(gP);
                    //bP = oPath(200, 150, 200, 250, 300, 100, Colors.Blue);

                    nxtBtn.IsEnabled = false;
                    prvBtn.IsEnabled = false;
                    gP.Name = "gTriangle";
                    Storyboard.SetTargetName(rotateTriangle, gP.Name);
                    RotateTransform rot = new RotateTransform();
                    rot.Angle = 0;
                    rot.CenterX = 200;
                    rot.CenterY = 150;

                    gP.RenderTransform = rot;
                    rotateTriangle.Begin();

                    break;
                case 4: //"M200,200 L300,150 L340,230Z"
                    //theCanvas.Children.Remove(bP);
                    //rP = oPath(200, 150, 300, 100, 340, 180, Colors.Red);

                    nxtBtn.IsEnabled = false;
                    prvBtn.IsEnabled = false;
                    bP.Name = "bTriangle";
                    Storyboard.SetTargetName(movePoint2, bP.Name);
                    movePoint2.Begin();
                    break;
            }
        }

        private void BottomNext()
        {
            Path p = null;
            switch (step)
            {
                case 5: 
                    y2P = oPath(200,250, 250,250, 250,300, Colors.Yellow);
                    break;
                case 6: 
                    theCanvas.Children.Remove(y2P);
                    g2P = oPath(200,150, 250,250, 250,300, Colors.Green);
                    break;
                case 7: //"M200,200 L200,300 L300,150Z"
                    theCanvas.Children.Remove(g2P);
                    b2P = oPath(200,250, 250,250, 350,200, Colors.Blue);
                    break;
                case 8: //"M200,200 L300,150 L340,230Z"
                    theCanvas.Children.Remove(b2P);
                    r2P = oPath(340,180, 250,250, 350,200, Colors.Red);
                    break;
            }
        }


        private void Prv_Click(object sender, RoutedEventArgs e)
        {
            step--;
            if (step < 0)
            {
                step = 0;
                return;
            }
            if (step < 4) UpperPrevious();
            if (step > 3) BottomPrevious();
        }

        private void UpperPrevious()
        {
            Path p = null;
            switch (step)
            {
                case 0:
                    theCanvas.Children.Remove(yP);
                    break;
                case 1:
                    theCanvas.Children.Remove(gP);
                    yP = oPath(200, 150, 100, 150, 200, 250, Colors.Yellow);
                    break;
                case 2:
                    theCanvas.Children.Remove(bP);
                    gP = oPath(200, 150, 100, 150, 250, 250, Colors.Green);
                    break;
                case 3:
                    theCanvas.Children.Remove(rP);
                    bP = oPath(200, 150, 200, 250, 300, 100, Colors.Blue);
                    break;
            }
        }

        private void BottomPrevious()
        {
            Path p = null;
            switch (step)
            {
                case 4:
                    theCanvas.Children.Remove(y2P);
                    break;
                case 5:
                    theCanvas.Children.Remove(g2P);
                    y2P = oPath(200,250, 250,250, 250,300, Colors.Yellow);
                    break;
                case 6:
                    theCanvas.Children.Remove(b2P);
                    g2P = oPath(200,150, 250,250, 250,300, Colors.Green);
                    break;
                case 7:
                    theCanvas.Children.Remove(r2P);
                    b2P = oPath(200,250, 250,250, 350,200, Colors.Blue);
                    break;
            }
        }

        private Path oPath(double X0, double Y0, double X1, double Y1, double X2, Double Y2, Color c)
        {//200,200 100,200 200,300
            PathGeometry pg = new PathGeometry();
            PathFigure pf = new PathFigure();
            pf.IsClosed = true;
            pf.StartPoint = new Point(X0, Y0);
            pg.Figures.Add(pf);

            LineSegment ls1 = new LineSegment();
            ls1.Point = new Point(X1, Y1);
            pf.Segments.Add(ls1);

            LineSegment ls2 = new LineSegment();
            ls2.Point = new Point(X2, Y2);
            
            pf.Segments.Add(ls2);

            Path p = new Path();
            //p.Name = "yPath";
            p.Fill = new SolidColorBrush(c);
            p.Stroke = new SolidColorBrush(Colors.Black);
            p.Opacity = 0.4;
            p.Data = pg;

            theCanvas.Children.Add(p);
            return p;
        }

        private void movePoint_Completed(object sender, EventArgs e)
        {
            theCanvas.Children.Remove(yP);
            gP = oPath(200, 150, 100, 150, 250, 250, Colors.Green);
            nxtBtn.IsEnabled = true;
            prvBtn.IsEnabled = true;
            movePoint.Stop();

        }

        private void rotateTriangle_Completed(object sender, EventArgs e)
        {
            theCanvas.Children.Remove(gP);
            bP = oPath(200, 150, 200, 250, 300, 100, Colors.Blue);
            
            /* Load from XAML
            string bTriangle = "<Path  xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'  Name='bTriangle' Opacity='0.4' Stroke='Black' Fill='Blue' Data='M200,150 L200,250 L300,100z'/>";
            Path p = (Path)XamlReader.Load(bTriangle);
            bP = p;
            theCanvas.Children.Add(p);
            */

            nxtBtn.IsEnabled = true;
            prvBtn.IsEnabled = true;

            rotateTriangle.Stop();

        }

        private void movePoint2_Completed(object sender, EventArgs e)
        {
            theCanvas.Children.Remove(bP);
            rP = oPath(200, 150, 300, 100, 340, 180, Colors.Red);
            nxtBtn.IsEnabled = true;
            prvBtn.IsEnabled = true;

            movePoint2.Stop();

        }

        /*
         * On demand Load a dll and extract a resource
         * Do an Async GET request for the /ClientBin/PythResources.dll
         * Upon download, load the assembly and instantiate objects out of it
         
        private void dmd_Click(object sender, RoutedEventArgs e)
        {
            WebClient webClient = new WebClient();
            webClient.OpenReadCompleted += new OpenReadCompletedEventHandler(webClient_OpenReadCompleted);
            webClient.OpenReadAsync(new Uri("/ClientBin/PythResources.dll",UriKind.Relative));
        }

        void webClient_OpenReadCompleted(object sender, OpenReadCompletedEventArgs e)
        {
            AssemblyPart part = new AssemblyPart();
            Assembly asm = part.Load(e.Result);
         
            ImageBrush brush = new ImageBrush();
            brush.ImageSource = 
                new System.Windows.Media.Imaging.BitmapImage(
                    new Uri("/PythResources;component/images/SandF.jpg", UriKind.Relative));

            theCanvas.Background = brush;

        }
        */

    }
}
