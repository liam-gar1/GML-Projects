package com.example.camerademo4;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;
import android.graphics.Bitmap;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import android.graphics.drawable.BitmapDrawable;

import androidx.appcompat.app.AppCompatActivity;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;

public class MainActivity extends AppCompatActivity {
    Button btnExplore, sendButton;
    ImageView selectedImage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnExplore = findViewById(R.id.btnExplore);
        sendButton = findViewById(R.id.send_button);
        selectedImage = findViewById(R.id.selectedImage);

        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                // Execute the AsyncTask to send the message
                SendMessageTask sendMessageTask = new SendMessageTask();
                sendMessageTask.execute();
            }
        });

        btnExplore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_PICK, MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                startActivityForResult(intent, 1);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 1 && resultCode == RESULT_OK && data != null) {
            Uri selectedImageUri = data.getData();
            try {
                Bitmap bitmap = MediaStore.Images.Media.getBitmap(getContentResolver(), selectedImageUri);
                selectedImage.setImageBitmap(bitmap);
                selectedImage.setVisibility(View.VISIBLE);
                sendButton.setVisibility(View.VISIBLE);
                btnExplore.setVisibility(View.GONE);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private class SendMessageTask extends AsyncTask<Void, Void, String> {
        @Override
        protected String doInBackground(Void... voids) {
            String serverIpAddress = "192.168.0.115";
            int serverPort = 1234;
            Bitmap bitmap = ((BitmapDrawable) selectedImage.getDrawable()).getBitmap();
            Bitmap scaledBitmap = Bitmap.createScaledBitmap(bitmap, 504, 378, false);

            try {
                // Create a socket connection to the server
                Socket socket = new Socket(serverIpAddress, serverPort);

                // Create an output stream to send the message to the server
                DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());

                // Convert the bitmap to a byte array
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                scaledBitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
                byte[] byteArray = byteArrayOutputStream.toByteArray();

                // Send the byte array to the server
                outputStream.writeInt(byteArray.length);
                outputStream.write(byteArray);
                outputStream.flush();

                // Create an input stream to read the response from the server
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                String response = bufferedReader.readLine();

                // Close the streams and socket
                outputStream.close();
                bufferedReader.close();
                socket.close();

                // Return the response from the server
                return response;
            } catch (IOException e) {
                e.printStackTrace();
            }

            // If an error occurred, return null
            return null;
        }

        @Override
        protected void onPostExecute(String response) {
            super.onPostExecute(response);

            // Display the response from the server
            if (response != null) {
                Toast.makeText(MainActivity.this, "Response: " + response, Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(MainActivity.this, "Error occurred while sending message", Toast.LENGTH_SHORT).show();
            }
        }
    }
}