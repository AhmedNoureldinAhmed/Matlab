
% Read From  File
 myFileR= fopen('input.txt','r');
f = fscanf(myFileR,'%f',[1 inf]);
 fclose(myFileR);
 
% Calculate Class Width 
numClass = ceil(( 1 + log10(length(f)) / log10(2))); % Number oF Classes Sturges Rule
range = max(f) - min(f) ;
classWidth = ceil( range / numClass ) ;


% Class Limit 

lower = repmat(min(f),numClass,1) ;%Pre Allocate Array For Looping 

for i = 1 : numClass-1 
    lower(i+1)  = lower(i) + classWidth;
end
   
upper = repmat(min(f),numClass,1) ;%Pre Allocate Array For Looping 
for i = 1 : numClass 
    upper(i)  = lower(i) + classWidth-1;
end

 % Make Tally 
  tally = zeros(numClass,1);
for i=1 : length(f)
    for j=1 : numClass
                if(f(i) >= lower(j) && f(i) <= upper(j))
                    tally(j) = tally(j) + 1 ;
                       end
        end
end

  % Write To File 
  freqDis= fopen('output.txt','w','a'); % For Append Data 
  
  fprintf(freqDis,' Frequency Table \r\n \r\n' );
    fprintf(freqDis,' Class Limit \t frequency  \r\n' );
    for i=1 : numClass
         fprintf(freqDis,' %d - %d \t  %d \r\n',lower(i),upper(i),tally(i));
    end
      fclose(freqDis);

    
  