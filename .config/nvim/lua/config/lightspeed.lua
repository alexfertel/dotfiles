require("lightspeed").setup({
  -- This can get _really_ slow if the window has a lot of content,
  -- turn it on only if your machine can always cope with it.
  match_only_the_start_of_same_char_seqs = true,
  limit_ft_matches = 5,
  -- By default, the values of these will be decided at runtime,
  -- based on `jump_to_first_match`.
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil,
})
