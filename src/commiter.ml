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

open Git


let interactive_a () =
  let ct = Util.now () in
  let dyear = ct.Unix.tm_year + 1900
  and dmonth = ct.Unix.tm_mon + 1
  and dday = ct.Unix.tm_mday in
  let year = Util.read_int ~prompt:(Format.sprintf "Year : %d >") ~default:dyear () in
  let month = Util.read_int ~prompt:(Format.sprintf "Month : %d >") ~default:dmonth () in
  let day = Util.read_int ~prompt:(Format.sprintf "Day : %d >") ~default:dday () in
  let message = Util.read_line ~prompt:"Message>" () in
  Git.commit_at year month day message

let () =
  interactive_a ()
  |> ignore
