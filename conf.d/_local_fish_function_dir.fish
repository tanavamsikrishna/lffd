function _remove_previous_dir
    if test -n $_lffd_dir_full_path
        set index (contains -i $_lffd_dir_full_path $fish_function_path)
        if set -q index[1]
            set -e fish_function_path[$index]
        end
    end
    set -ge _lffd_dir_full_path
end

function _local_fish_function_dir --on-variable PWD
    set -f local_fish_functions_dir (realpath ./.fish-functions)
    if test $_lffd_dir_full_path = $local_fish_functions_dir
        return
    end
    _remove_previous_dir
    if test -d ./.fish-functions
        set -g _lffd_dir_full_path $local_fish_functions_dir
        if not contains $_lffd_dir_full_path $fish_function_path
            set fish_function_path $_lffd_dir_full_path $fish_function_path
        else
            set -ge _lffd_dir_full_path
        end
    end
end
