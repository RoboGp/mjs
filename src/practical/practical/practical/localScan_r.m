% return a list of distances scanned at the specified angle
function [USDists manoeuvre manoeuvre_dir]  = localScan_r(USDists2, manoeuvre, manoeuvre_dir)
USDists = USDists2;
% if(USDists(1) == 60 && (USDists(2) < 25 || USDists(end) < 25 || USDists(2) == 60 || USDists(end) == 60))
%     USDists(1) = 8;
%     USDists(2) = 8;
%     USDists(end) = 8;
% elseif (USDists(2) == 60 && (USDists(1) < 25 || USDists(end) < 25 || USDists(1) == 60 || USDists(end) == 60))
%     USDists(1) = 8;
%     USDists(2) = 8;
%     USDists(end) = 8;
% elseif (USDists(end) == 60 && (USDists(2) < 25 || USDists(1) < 25 || USDists(2) == 60 || USDists(1) == 60))
%     USDists(1) = 8;
%     USDists(2) = 8;
%     USDists(end) = 8;
% end

%%
manoeuvre = false;
manoeuvre_dir = false;
safety_dist = 20;

if (mean(USDists([1 2 18])) < safety_dist || (USDists(1) < 12 || USDists(3) < 12 || USDists(17) < 12))
    'front blocked'
    USDists([1 2 3 17 18]) = 8;
    if(mean(USDists([4 5 6])) < safety_dist || USDists(4) < safety_dist || USDists(5) < safety_dist || USDists(6) < safety_dist)
        'left blocked'
        USDists(8) = 8;
        manoeuvre = true;
        manoeuvre_dir = true;
    elseif(mean(USDists([13 14 15])) < safety_dist  || USDists(13) < safety_dist || USDists(14) < safety_dist || USDists(15) < safety_dist)
        'right blocked'
        USDists(14) = 8;
        manoeuvre = true;
        manoeuvre_dir = false;
    elseif(mean(USDists([7 8 9])) < safety_dist  || USDists(7) < safety_dist || USDists(8) < safety_dist || USDists(9) < safety_dist)
        'back left blocked'
        USDists([7 8 9]) = 8;
    elseif(mean(USDists([11 12 13])) < safety_dist  || USDists(11) < safety_dist || USDists(12) < safety_dist || USDists(13) < safety_dist)
        'back right blocked'
        USDists([11 12 13]) = 8;
    end
elseif(mean(USDists([7 8 9])) < safety_dist  || USDists(7) < safety_dist || USDists(8) < safety_dist || USDists(9) < safety_dist)
    'front left blocked'
    USDists([1 2 3 8]) = 8;
    if(mean(USDists([2 3 4])) < safety_dist  || USDists(2) < safety_dist || USDists(3) < safety_dist || USDists(4) < safety_dist)
        'left blocked'
        USDists([1 3 8]) = 8;
        manoeuvre = true;
        manoeuvre_dir = true;
    end
elseif (mean(USDists([13 14 15])) < safety_dist  || USDists(13) < safety_dist || USDists(14) < safety_dist || USDists(15) < safety_dist)
    'front right blocked'
    USDists([1 14 17 18]) = 8;
    if(mean(USDists([16 17 18])) < safety_dist || USDists(16) < safety_dist || USDists(17) < safety_dist || USDists(18) < safety_dist)
        'right blocked'
        USDists([1 14 17]) = 8;
        manoeuvre = true;
        manoeuvre_dir = false;
    end
else
    'front clear'
    if(mean(USDists([15 16 17])) < safety_dist || mean(USDists([14 15 16])) < safety_dist || mean(USDists([16 17 18])) < safety_dist)
        'right not clear'
        %USDists([1 14 17]) = 8;
        manoeuvre = true;
        manoeuvre_dir = false;
    elseif(mean(USDists([2 3 4])) < safety_dist || mean(USDists([3 4 5])) < safety_dist || mean(USDists([4 5 6])) < safety_dist)
        'left not clear'
        %USDists([1 3 8]) = 8;
        manoeuvre = true;
        manoeuvre_dir = true;
    end
end

%%
% if(USDists(1) == 60)
%     if(USDists(3) < 25)
%         USDists(1) = 8;
%         USDists(3) = 8;
%         if(USDists(8) < 25)
%             USDists(17) = 8;
%         end
%     elseif(USDists(17) < 25 || USDists(16) < 25)
%         USDists(1) = 8;
%         USDists(17) = 8;
%         if(USDists(14) < 25)
%             USDists(17) = 8;
%         end
%     elseif((USDists(3) == 60 && USDists(17) < 25) || (USDists(17) == 60 && USDists(3) < 25))
%         USDists(1) = 8;
%         USDists(3) = 8;
%         USDists(17) = 8;
%     elseif(USDists(2) == 60 && USDists(18) == 60)
%         USDists(1) = 8;
%         USDists(3) = 8;
%         USDists(17) = 8;
%     end
% elseif (USDists(3) == 60 || USDists(2) == 60 || USDists(4) == 60)
%     if(USDists(1) < 25)
%         USDists(1) = 8;
%         USDists(3) = 8;
%     elseif(USDists(8) < 25)
%         USDists(3) = 8;
%         USDists(8) = 8;
%         %USDists(1) = 60;
%     end
% elseif (USDists(17) == 60  || USDists(16) == 60)
%     if(USDists(3) < 25 || USDists(2) < 25 || USDists(4) < 25)
%         USDists(17) = 8;
%         USDists(3) = 8;
%         if(USDists(14) < 25)
%             USDists(17) = 8;
%             USDists(14) = 8;
%             %USDists(1) = 60;
%         end
%     elseif(USDists(1) < 25)
%         USDists(1) = 8;
%         USDists(17) = 8;
%     end
% end

%%
% if(USDists(1) == 60 && (USDists(3) < 25 || USDists(17) < 25 || USDists(3) == 60 || USDists(17) == 60))
%     USDists(1) = 8;
%     USDists(3) = 8;
%     USDists(17) = 8;
% elseif (USDists(3) == 60 && (USDists(1) < 25 || USDists(17) < 25 || USDists(1) == 60 || USDists(17) == 60))
%     USDists(1) = 8;
%     USDists(3) = 8;
%     USDists(17) = 8;
% elseif (USDists(17) == 60 && (USDists(3) < 25 || USDists(1) < 25 || USDists(3) == 60 || USDists(1) == 60))
%     USDists(1) = 8;
%     USDists(3) = 8;
%     USDists(17) = 8;
% end

