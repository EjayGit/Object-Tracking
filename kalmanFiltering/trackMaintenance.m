function [ tracks, delete ] = trackMaintenance( associate, tracks )

trackDelete = zeros(size( tracks, 2 ), 1);

if ~isempty(tracks)
    if ~isempty(tracks(1).active)

        % For each track.
        for track = 1 : 1 : size( tracks, 2 )

            % Find length of track data.
            trackTime = size(tracks(track).timestamp,2);

            % If the size of a track is less than 'x', tracks(current).active = 2.
            if trackTime < associate.deactivateNum

                tracks(track).active(1, trackTime) = 2;

                % Check if the corresponding .X is empty, then fill it with the
                % tracks(current - 1).XPred(R1&3, C_Last), and set
                % tracks(current).active = 2.
                if size(tracks(track).X, 2) ~= size(tracks(track).timestamp, 2)

                    tracks(track).X = cat(2, tracks(track).X, [tracks(track).XPred(1, size(tracks(track).XPred, 2)); tracks(track).XPred(3, size(tracks(track).XPred, 2)) ]);

                end

            else

                % Make .active = 1.
                tracks(track).active(1, trackTime) = 1;

        %         % If the previous 'x' timestamps all have '1' associated in their
        %         % corresponding .active fields, then tracks(current).active = 1.
        %         check1 = 0;
        %         for count = 1 : 1 : ( associate.deactivateNum - 1 )
        % 
        %             if tracks(track).active( 1, timeLen - count ) == 1
        % 
        %                 check1 = check1 + 1;
        % 
        %             end
        %             
        %         end
        % 
        %         if check1 == ( associate.deactivateNum - 1 )
        % 
        %             tracks(track).active = cat(2, tracks(track).active, 1 );
        % 
        %         else
        % 
        %             tracks(track).active = cat(2, tracks(track).active, 2 );
        % 
        %         end



                % If the corresponding .X is empty, then fill it with the
                % tracks(current - 1).XPred(R1&3, C_Last), and set
                % tracks(current).active = 2.
                if size(tracks(track).X, 2) ~= size(tracks(track).timestamp, 2)

                    tracks(track).X = cat(2, tracks(track).X, [tracks(track).XPred(1, size(tracks(track).XPred, 2)); tracks(track).XPred(3, size(tracks(track).XPred, 2)) ]);
                    tracks(track).active(1, trackTime) = 2;

                end

                % If the previous 'x' timestamps all have '2' associated in their
                % corresponding .active fields, then delete track.
                check2 = 0;
                for count = 0 : 1 : ( associate.deactivateNum - 1 )

                    if tracks(track).active( 1, trackTime - count ) == 2

                        check2 = check2 + 1;

                    end

                end
                if check2 == ( associate.deactivateNum )

                    % Set mark for track deletion.
                    trackDelete(track, 1) = 1;

                end

            end
        end
    end
end

% Delete marked tracks
delete = [];
if ~isempty(tracks)
    if ~isempty(tracks(1).active)
        for track = 1 : 1 : size( tracks, 2 )
            
            if trackDelete(track) == 1
                
                delete = cat(2, delete, track);
                
            end
        end
    end
end

end

