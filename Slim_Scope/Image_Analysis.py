import cv2
from skimage.metrics import structural_similarity as ssim_metric
import numpy as np
import os

working_directory = os.path.dirname(os.path.abspath(__file__))
dir_image = working_directory+'/DatafilesResized Captures/'
dir_database = working_directory+'Datafiles/Database/'

while True:
    with open(working_directory+'/Datafiles/database_activation.txt', 'r') as binary:
        activation = binary.read().strip()
    
    if activation == '1':
        with open(working_directory+'/Datafiles/comparison_completed.txt', 'w') as binary:
            binary.write('0')

        with open(working_directory+'/Datafiles/display_image_name.txt', 'r') as file:
            image = file.read()
        
        with open(working_directory+'/Datafiles/file_names.txt', 'w') as name_of_file:
            name_of_file.write('')        
        
        with open(working_directory+'/Datafiles/display_names.txt', 'w') as display:
            display.write('')

        with open(working_directory+'/Datafiles/confidence.txt', 'w') as confidence:
            confidence.write('')

        ssim_results = {}  # dictionary to store SSIM percentage for each image file

        iterations=0

        for file_name in os.listdir(dir_database):
            # load the images
            img1 = cv2.imread(dir_image+image)
            img2 = cv2.imread(dir_database+file_name)

            # convert the images to RGB format
            img1 = cv2.cvtColor(img1, cv2.COLOR_BGR2RGB)
            img2 = cv2.cvtColor(img2, cv2.COLOR_BGR2RGB)

            # resize the database image to the dimensions of the resized received image
            img2 = cv2.resize(img2, (504, 378))

            # calculate the structural similarity index
            win_size = 3  # explicit value for win_size
            ssim_index = ssim_metric(img1, img2, multichannel=True, win_size=win_size)
            ssim_percent = (ssim_index + 1) / 2 * 100

            # store SSIM percentage for current image file in dictionary
            ssim_results[file_name] = ssim_percent

            iterations=iterations+1
        
        # sort dictionary by value in descending order
        ssim_results = {k: v for k, v in sorted(ssim_results.items(), key=lambda item: item[1], reverse=True)}

        # print results
        print("\n")
        for file_name, ssim_percent in ssim_results.items():
            #print(f"{file_name}: {ssim_percent:.2f}")
            print(file_name.split(".")[0]+": "+f"{ssim_percent:.2f}")
            with open(working_directory+'/Datafiles/file_names.txt', 'a') as name_of_file:
                name_of_file.write(file_name+"\n")        
            with open(working_directory+'/Datafiles/display_names.txt', 'a') as display:
                display.write(file_name.split(".")[0]+"\n")
            with open(working_directory+'/Datafiles/confidence.txt', 'a') as confidence:
                confidence.write(f"{ssim_percent:.2f}"+"\n")

        with open(working_directory+'/Datafiles/match_quantity.txt', 'w') as match_quantity:
            match_quantity.write(str(iterations))

        with open(working_directory+'/Datafiles/comparison_completed.txt', 'w') as binary:
            binary.write('1')
        
        with open(working_directory+'/Datafiles/database_activation.txt', 'w') as binary:
            binary.write('0')