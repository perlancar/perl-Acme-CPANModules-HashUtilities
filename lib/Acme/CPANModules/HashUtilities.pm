package Acme::CPANModules::HashUtilities;

# DATE
# VERSION

our $LIST = {
    summary => "Modules that manipulate hashes",
    description => <<'_',

Most of the time, you don't need modules to manipulate hashes; Perl's built-in
facilities suffice. The modules below, however, are sometimes convenient. This
list is organized by task.

## Creating an alias to another variable

<pm:Hash::Util>'s C<hv_store> allows you to store an alias to a variable in a
hash instead of copying the value. This means, if you set a hash value, it will
instead set the value of the aliased variable instead. Copying from Hash::Util's
documentation:

    my $sv = 0;
    hv_store(%hash,$key,$sv) or die "Failed to alias!";
    $hash{$key} = 1;
    print $sv; # prints 1


## Getting internal information

Aside from creating restricted hash, <pm:Hash::Util> also provides routines to
get information about hash internals, e.g. `hash_seed()`, `hash_value()`,
`bucket_info()`, `bucket_stats()`, etc.


## Merging

Merging hashes is usually as simple as:

    my %merged = (%hash1, %hash2, %hash3);

but sometimes you want different merging behavior, particularly in case where
the same key is found in more than one hash. See the various hash merging
modules:

<pm:Hash::Merge>

<pm:Data::ModeMerge>

<pm:Hash::Union>


## Providing default value for non-existing keys

<pm:Hash::WithDefault>


## Restricting keys

Perl through <pm:Hash::Util> (a core module) allows you to restrict what keys
can be set in a hash. This can be used to protect against typos and for simple
validation. (For more complex validation, e.g. allowing patterns of valid keys
and/or rejecting patterns of invalid keys, you can use the tie mechanism.)


## Reversing (inverting)

Reversing a hash (where keys become values and values become keys) can be done
using the builtin's `reverse` (which actually just reverse a list):

    %hash = (a=>1, b=>2);
    %reverse = reverse %hash; # => (2=>"b", 1=>"a")

Since the new keys can contain duplicates, this can "destroy" some old keys:

    %hash = (a=>1, b=>1);
    %reverse = reverse %hash; # => sometimes (1=>"b"), sometimes (1=>"a")

<pm:Hash::MoreUtil>'s `safe_reverse` allows you to specify a coderef that can
decide whether to ignore overwriting, croak, or whatever else.


## Slicing (creating subset)

<pm:Hash::MoreUtils>'s `slice_*` functions.

<pm:Hash::Subset>

<pm:Hash::Util::Pick>


## Tying

The tie mechanism, although relatively slow, allows you to create various kinds
of "magical" hash that does things whenever you get or set keys.


_
    'x.app.cpanmodules.show_entries' => 0,
};

$LIST->{entries} = [
    map { +{module=>$_} }
        do { my %seen; grep { !$seen{$_}++ }
             ($LIST->{description} =~ /<pm:(\w+(?:::\w+)*)>/g)
         }
];

1;
# ABSTRACT:

=head1 DESCRIPTION
