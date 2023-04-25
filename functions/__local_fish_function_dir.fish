# loading directory local fish functions
function __local_fish_function_dir --on-variable PWD
    if test -d ./.fish-functions
        set -g __lffd_dir_full_path (realpath ./.fish-functions)
        if not contains $__lffd_dir_full_path $fish_function_path
            set fish_function_path $__lffd_dir_full_path $fish_function_path
            return
        end
    end
    if test -n $__lffd_dir_full_path
        set index (contains -i $__lffd_dir_full_path $fish_function_path)
        if set -q index[1]
            set -e fish_function_path[$index]
        end
    end
end
