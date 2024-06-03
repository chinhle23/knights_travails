# frozen_string_literal: true

# This houses the methods of a knight graph representing the possible moves of a knight piece in chess
class KnightGraph
  attr_accessor :lower_limit, :upper_limit, :vertices_list

  def initialize
    @lower_limit = 0
    @upper_limit = 7
    @vertices_list = build_vertices_list
  end

  def knight_moves(start, finish)
    adjacency_list = build_adjacency_list(vertices_list)
    bfs_info = bfs_info(adjacency_list, vertices_list, vertices_list.index(start))

    end_idx = vertices_list.index(finish)
    num_of_moves = bfs_info[end_idx][:distance]
    current_vertex = bfs_info[end_idx]
    move_queue = [vertices_list[end_idx]]
    until current_vertex[:predecessor].nil?
      move_queue.push(vertices_list[current_vertex[:predecessor]])
      current_vertex = bfs_info[current_vertex[:predecessor]]
    end

    puts "You made it in #{num_of_moves} move(s)! Here's your path:"
    p move_queue.pop until move_queue.empty?
  end

  private

  def build_vertices_list
    vertices_list = []

    i = 0
    while i <= 7
      j = 0
      while j <= 7
        vertices_list.push([i, j])
        j += 1
      end
      i += 1
    end

    vertices_list
  end

  def build_adjacency_list(vertices)
    adjacency_list = []

    vertices.each do |vertex|
      x = vertex[0]
      y = vertex[1]
      adjacents = []
      adjacents.push([x - 2, y - 1]) if x - 2 >= lower_limit && y - 1 >= lower_limit

      adjacents.push([x - 2, y + 1]) if x - 2 >= lower_limit && y + 1 <= upper_limit

      adjacents.push([x - 1, y + 2]) if x - 1 >= lower_limit && y + 2 <= upper_limit

      adjacents.push([x + 1, y + 2]) if x + 1 <= upper_limit && y + 2 <= upper_limit

      adjacents.push([x + 2, y + 1]) if x + 2 <= upper_limit && y + 1 <= upper_limit

      adjacents.push([x + 2, y - 1]) if x + 2 <= upper_limit && y - 1 >= lower_limit

      adjacents.push([x + 1, y - 2]) if x + 1 <= upper_limit && y - 2 >= lower_limit

      adjacents.push([x - 1, y - 2]) if x - 1 >= lower_limit && y - 2 >= lower_limit

      adjacency_list.push(adjacents)
    end

    adjacency_list
  end

  def bfs_info(graph, vertices_list, start)
    bfs_info = []

    i = 0
    while i < graph.length
      bfs_info[i] = {
        distance: nil,
        predecessor: nil
      }
      i += 1
    end

    bfs_info[start][:distance] = 0

    queue = [start]

    until queue.empty?
      u = queue.shift
      j = 0
      while j < graph[u].length
        v = vertices_list.index(graph[u][j])
        if bfs_info[v][:distance].nil?
          bfs_info[v][:distance] = bfs_info[u][:distance] + 1
          bfs_info[v][:predecessor] = u
          queue.push(v)
        end
        j += 1
      end
    end

    bfs_info
  end
end
