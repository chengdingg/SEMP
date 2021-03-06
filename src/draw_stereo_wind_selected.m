% this function draw the signal of selected range
% author : P.J.Zhang
% date :  2018-4-25 21:57:02

function draw_stereo_wind_selected ...
    (T_ste,T_wind,F_ste,F_wind,S_ste_A,S_ste_B,S_wind,time_range,clim_ste,clim_wind,fname)
    
    t1=time_range(1);
    t2=time_range(2);
    
    %use minute to label the time
    xlim_t1=0;
    xlim_t2=(t2-t1)*24*60;
    
    figure()
    
    set(gcf,'position',[  161.0000  131.4000  1990  780])
    subplot(131)
    h=pcolor(T_ste,F_ste,S_ste_A);
    h.EdgeColor='none';
    set(gca,'clim',[0,clim_ste])
    set(gca, 'YScale', 'log')
    xlim([xlim_t1,xlim_t2])
    ylim([20 1.4e4])
    title('STEREO A')
    set(gca,'Layer','top')
    %set(gca,'XTickLabelRotation',-45)
    %datetick('x','HH:MM:SS','keeplimits')
    colormap(jet)
    shading interp
    ylabel('Frequency (kHz)')

    subplot(132)
    h=pcolor(T_wind,F_wind,S_wind);
    h.EdgeColor='none';
    set(gca,'clim',[0,clim_wind])
    set(gca, 'YScale', 'log')
    xlim([xlim_t1,xlim_t2])
    title('WIND')
    ylim([20 1.4e4])
    set(gca,'Layer','top')
    %set(gca,'XTickLabelRotation',-45)
    %datetick('x','HH:MM:SS','keeplimits')
    colormap(jet)
    shading interp
    xlabel(['Time (minute) started from ', datestr(t1)])
    

    subplot(133)
    h=pcolor(T_ste,F_ste,S_ste_B);
    h.EdgeColor='none';
    set(gca,'clim',[0,clim_ste])
    set(gca, 'YScale', 'log')
    xlim([xlim_t1,xlim_t2])
    title('STEREO B')
    ylim([20 1.4e4])
    set(gca,'Layer','top')
    %set(gca,'XTickLabelRotation',-45)
    %datetick('x','HH:MM:SS','keeplimits')
    colormap(jet)
    colormap(color_vacu)
    shading interp
    
    set(gcf,'position',[  161.0000  131.4000 720  480])
    if exist('fname','var')    
        print(fname,'-djpeg','-r400')
    end
    
end