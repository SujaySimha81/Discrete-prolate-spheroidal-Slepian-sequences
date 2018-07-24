function [mx,px]=dftanalysis(x,w,N)
            %x:signal,w:analysis window,N:fft size
            hN=N/2+1;
            b=size(w);
            s=b(1,2);
            x=x(1,1:s);
            hM1=floor((s+1)/2);
            hM2=floor(s/2);
            fftbuffer=zeros(1,N);
            xw=x.*w;
            fftbuffer(1,1:hM1)=xw(1,hM2+1:s);
            fftbuffer(1,N-hM2+1:N)=xw(1,1:hM2);
            
            X=fft(fftbuffer);
            mx=20*log10(abs(X(1:hN)));
            px=unwrap(angle(X(1:hN)));
end

            
            