%function reconstruct_path(came_from, current_node)
%    if current_node in came_from
%        p := reconstruct_path(came_from, came_from[current_node])
%        return (p + current_node)
%    else
%        return current_node