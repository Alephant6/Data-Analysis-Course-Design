% display all the images in one
m=5;n=4;
figure,
time=1;
for i=1:m
    for j=1:n
      f=[num2str(time) '.jpg'];
        s=imread(f);
        subplot(m,n,time,'align'),imshow(s);    
        %imshow(s);
        time=time+1;
    end
end




% figure,
%         s=imread('1.jpg');
%         subplot(5,4,1,'align');  
%         imshow(s);
% %         time=time+1;
% 
% s=imread('2.jpg');
%         subplot(5,4,2,'align');    
%         imshow(s)
%         
%         s=imread('3.jpg');
%         subplot(5,4,3,'align'),imshow(s);    
%         
%         s=imread('4.jpg');
%         subplot(5,4,4,'align'),imshow(s);   
%         
%          s=imread('5.jpg');
%         subplot(5,4,5,'align');  
%         imshow(s);
% %         time=time+1;
% 
% s=imread('6.jpg');
%         subplot(5,4,6,'align');    
%         imshow(s)
%         
%         s=imread('7.jpg');
%         subplot(5,4,7,'align'),imshow(s);    
%         
%         s=imread('8.jpg');
%         subplot(5,4,8,'align'),imshow(s);  
%         
%         s=imread('9.jpg');
%         subplot(5,4,9,'align');  
%         imshow(s);
% %         time=time+1;
% 
% s=imread('10.jpg');
%         subplot(5,4,10,'align');    
%         imshow(s)
%         
%         s=imread('11.jpg');
%         subplot(5,4,11,'align'),imshow(s);    
%         
%         s=imread('12.jpg');
%         subplot(5,4,12,'align'),imshow(s); 
%          
%         s=imread('13.jpg');
%         subplot(5,4,13,'align');  
%         imshow(s);
% %         time=time+1;
% 
% s=imread('14.jpg');
%         subplot(5,4,14,'align');    
%         imshow(s)
%         
%         s=imread('15.jpg');
%         subplot(5,4,15,'align'),imshow(s);    
%         
%         s=imread('16.jpg');
%         subplot(5,4,16,'align'),imshow(s); 
%         
%         s=imread('17.jpg');
%         subplot(5,4,17,'align');  
%         imshow(s);
% %         time=time+1;
% 
% s=imread('18.jpg');
%         subplot(5,4,18,'align');    
%         imshow(s)
%         
%         s=imread('19.jpg');
%         subplot(5,4,19,'align'),imshow(s);    
%         
%         s=imread('20.jpg');
%         subplot(5,4,20,'align'),imshow(s);  