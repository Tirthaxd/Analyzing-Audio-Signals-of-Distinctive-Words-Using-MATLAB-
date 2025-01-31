# Analyzing-Audio-Signals-of-Distinctive-Words-Using-MATLAB- 
❖ To use Fourier analysis to examine the frequency components of the Bangla words 
"chaar" and "tiin." 
❖ To determine the unique qualities of the words' "aa" and "ii" vowel sounds. 
❖ To distinguish between the terms "chaar" and "tiin" using their distinct correlation 
patterns and frequency signatures. 
❖ To identify and match vowel sounds in audio sources using cross-correlation analysis. 


README for FFT and Cross-Correlation Analysis

Steps for FFT Analysis

1. Open the MATLAB File:
   Navigate to the codes section and open the FFTANALYSIS.m file in MATLAB.

2. Select the Voice File:
   - Go to the voice folder.
   - Choose your preferred voice file based on your preference (male or female).
     For example, use the file named "bro_TEEN" for audio_tin and the file named "bro_CHAAR" for audio_chaar.

3. Set the File Path:
   - Copy the file path of your chosen audio file.
   - Paste the file path into the audioread function in the MATLAB script.
   - Caution: If you change the voice file path, you must also update the dominant frequency array in Step 5 to reflect the new file. 
     To determine the correct values, refer to the plots provided in the plots folder.

4. Training Files Selection:
   - In the Step 1 section of the script, choose the training files.

5. Test Audio File Selection:
   - In the Step 6 section of the script, import your test audio file.

6. Run the Script:
   - After completing the above steps, press the Run button in MATLAB to view your FFT analysis.

Steps for Cross-Correlation Analysis

1. Open the MATLAB File:
   Navigate to the codes section and open the CorrAnalysis.m file in MATLAB.

2. Set the Voice File Paths:
   - Go to the voice folder and copy the paths for the EE and AA files.
   - Paste these paths into their respective audioread sections in the MATLAB script.

3. Select the Test File:
   - Choose any audio file from the voice folder for testing (based on your preference: male or female).
   - Copy the file path of the chosen test audio file.
   - Paste it into the test_file section of the audioread function in the script.

4. Run the Script:
   - Press the Run button in MATLAB to view your cross-correlation analysis results.

 

