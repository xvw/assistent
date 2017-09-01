(*
 * Some various tools to manage some useless tasks
 *
 * Copyright (C) 2017  Xavier Van de Woestyne <xaviervdw@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *)


let exec command =
  let chan = Unix.open_process_in command in
  let rec aux acc =
    try aux (Format.sprintf "%s%c" acc (input_char chan))
    with End_of_file -> acc
  in
  let result = aux "" in
  let _ = Unix.close_process_in chan in
  result


let download uri =
  exec ("curl -L --fail --silent --show-error " ^ uri)

let read_int ?(prompt = Format.sprintf "%d >") ?(default=0) () =
  let _ = print_string ((prompt default) ^ " ") in
  match read_int_opt () with
  | Some x -> x
  | None -> default

let read_line ?(prompt = ">") =
  let _ = print_endline prompt in
  read_line

let read_char ?(prompt = ">") () =
  let _ = print_endline prompt in
  Scanf.scanf "%c\n" (fun x -> x)

let rec yes_or_no ?(prompt = Format.sprintf "%c/%c>") ?(yes='y') ?(no='n') () =
  let c = read_char ~prompt:(prompt yes no) () in
  if c <> yes && c <> no then yes_or_no ~prompt ~yes ~no ()
  else c = yes

let now () =
  Unix.time ()
  |> Unix.gmtime
