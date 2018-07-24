function y=dftsynth(mx,px,M)
                %M:window size
            b=size(mx);
            s=b(1,2);
            N=2*s;
            hN=N/2;
            hM1=floor((M+1)/2);
            hM2=floor(M/2);
            fftbuffer=zeros(1,N);
            y=zeros(1,M);
            Y=zeros(1,N);
            Y(1:hN)=(10.^(mx/20)).*exp(1j*px);
            mx1=fliplr(mx);
            mx2=mx1(1,1:s-1);
            px1=fliplr(px);
            px2=px1(1,1:s-1);
            Y(1,hN+2:M)=(10.^(mx2/20)).*exp(-1*1j*px2);
            fftbuffer=real(ifft(Y));
            y(1,1:hM2)=fftbuffer(1,N-hM2+1:N);
            y(1,hM2+1:M)=fftbuffer(1,1:hM1);
end

            
            