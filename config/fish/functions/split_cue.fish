function split_cue
  set ext flac
  set audio_file ""
  set cue_file ""

  # Parse flags and arguments
  set i 1
  while test $i -le (count $argv)
    switch $argv[$i]
      case --ape
        set ext ape
      case '*'
        if test -z "$audio_file"
          set audio_file "$argv[$i]"
        else if test -z "$cue_file"
          set cue_file "$argv[$i]"
        else
          echo "Usage: split_cue [--ape] <audio_file> [cue_file]"
          return 1
        end
    end
    set i (math $i + 1)
  end

  if test -z "$audio_file"
    echo "Usage: split_cue [--ape] <audio_file> [cue_file]"
    return 1
  end

  set name (basename $audio_file .$ext)

  if test -z "$cue_file"
    set cue_file "$name.cue"
  end

  if not test -f "$audio_file"
    echo "Error: Audio file not found: $audio_file"
    return 1
  end

  if not test -f "$cue_file"
    echo "Error: Cue file not found: $cue_file"
    return 1
  end

  shnsplit -f "$cue_file" -t "%n - %t" -o flac "$audio_file" \
    && mv "$audio_file" "$audio_file"_ \
    && cuetag.sh "$cue_file" *.flac
end
