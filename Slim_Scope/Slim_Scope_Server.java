import java.awt.BorderLayout;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import java.io.OutputStream;
import java.io.File;
import java.io.FileWriter;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class Slim_Scope_Server {
    public static void main(String[] args) {
        
        try {
            String workingDirectory = System.getProperty("user.dir");

            ServerSocket serverSocket = new ServerSocket(1234);
            System.out.println("Server listening on port 1234");

            File folder1 = new File(workingDirectory+"\\Datafiles\\Captures");
            File[] files1 = folder1.listFiles();
            int fileCount1 = files1.length;
            String fileCountString1 = Integer.toString(fileCount1);
                
            FileWriter myWriter1 = new FileWriter(workingDirectory+"\\Datafiles\\image_number.txt");
            myWriter1.write(fileCountString1);
            myWriter1.close();

            FileWriter myWriter2 = new FileWriter(workingDirectory+"\\Datafiles\\database_activation.txt");
            myWriter2.write("0");
            myWriter2.close();

            FileWriter myWriter3 = new FileWriter(workingDirectory+"\\Datafiles\\comparison_completed.txt");
            myWriter3.write("0");
            myWriter3.close();

            while (true) {
                Socket socket = serverSocket.accept();
                System.out.println("Client connected from " + socket.getInetAddress());

                DataInputStream inputStream = new DataInputStream(socket.getInputStream());
                int length = inputStream.readInt();
                byte[] data = new byte[length];
                inputStream.readFully(data);

                BufferedImage image = ImageIO.read(new ByteArrayInputStream(data));

                JFrame frame = new JFrame();
                JLabel label = new JLabel(new ImageIcon(image));

                OutputStream outputStream = socket.getOutputStream();
                outputStream.write("Received by server".getBytes());
                System.out.println("Received by server");

                //Checks to see how many images are already in the folder
                File folder = new File(workingDirectory+"\\Datafiles\\Captures");
                File[] files = folder.listFiles();
                int fileCount = files.length+1;
                String fileCountString = Integer.toString(fileCount);

                // Save image to local directory
                File file = new File(workingDirectory+"\\Datafiles\\Captures\\image"+fileCount+".jpg");
                ImageIO.write(image, "jpg", file);

                FileWriter myWriter = new FileWriter(workingDirectory+"\\Datafiles\\image_number.txt");
                myWriter.write(fileCountString);
                myWriter.close();

                int newWidth = 504;
                int newHeight = 378;

                BufferedImage resizedImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = resizedImage.createGraphics();
                g.drawImage(image, 0, 0, newWidth, newHeight, null);
                g.dispose();

                File output1 = new File(workingDirectory+"\\Datafiles\\Resized Captures\\image"+fileCount+".jpg");
                ImageIO.write(resizedImage, "jpg", output1);

                int newerWidth = 84;
                int newerHeight = 63;

                BufferedImage icon = new BufferedImage(newerWidth, newerHeight, BufferedImage.TYPE_INT_RGB);
                Graphics2D g2 = icon.createGraphics();
                g2.drawImage(image, 0, 0, newerWidth, newerHeight, null);
                g2.dispose();

                File output2 = new File(workingDirectory+"\\Datafiles\\Icons\\image"+fileCount+".jpg");
                ImageIO.write(icon, "jpg", output2);

                socket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}