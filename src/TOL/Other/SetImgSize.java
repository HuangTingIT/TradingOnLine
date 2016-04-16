package TOL.Other;

import javax.imageio.ImageIO;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * Created by HuangTing on 2015/12/10.
 */
public class SetImgSize {
    public static byte[] ChangeImgSize(byte[]data,int width,int height){
        byte[]newdata=null;
        try{
            BufferedImage image= ImageIO.read(new ByteArrayInputStream(data));
            int w=image.getWidth();
            int h=image.getHeight();
            double sx=(double)width/w;
            double sy=(double)height/h;
            AffineTransform transform=new AffineTransform();
            transform.setToScale(sx,sy);
            AffineTransformOp ato=new AffineTransformOp(transform,null);
            BufferedImage bid=new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
            ato.filter(image,bid);

            //×ª»»³Ébyte×Ö½Ú
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            ImageIO.write(bid,"jepg",baos);
            newdata=baos.toByteArray();
        }catch(IOException e){
            e.printStackTrace();
        }
        return newdata;
    }
}
