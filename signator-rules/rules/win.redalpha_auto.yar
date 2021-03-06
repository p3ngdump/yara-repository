rule win_redalpha_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.redalpha."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.redalpha"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { e8???????? 83c40c c0e304 0fb6c3 50 68???????? }
            // n = 6, score = 400
            //   e8????????           |                     
            //   83c40c               | mov                 ecx, dword ptr [esp + 0x48]
            //   c0e304               | jmp                 0x79
            //   0fb6c3               | dec                 eax
            //   50                   | lea                 eax, [0xfffffd13]
            //   68????????           |                     

        $sequence_1 = { 50 e8???????? 83c40c c0e304 }
            // n = 4, score = 400
            //   50                   | nop                 
            //   e8????????           |                     
            //   83c40c               | dec                 eax
            //   c0e304               | lea                 ecx, [esp + 0x160]

        $sequence_2 = { 488b4c2448 ff542450 488b8d30070000 488d95e0020000 458bc5 e8???????? 4881c4f0070000 }
            // n = 7, score = 300
            //   488b4c2448           | or                  edx, 0xffffffff
            //   ff542450             | dec                 eax
            //   488b8d30070000       | mov                 ebx, eax
            //   488d95e0020000       | dec                 eax
            //   458bc5               | mov                 ecx, dword ptr [esp + 0x68]
            //   e8????????           |                     
            //   4881c4f0070000       | mov                 ecx, dword ptr [edi + 0x139a0]

        $sequence_3 = { 488b4b68 0fb78394000000 66890451 8383a0000000ff 7597 ff8394000000 448b8394000000 }
            // n = 7, score = 300
            //   488b4b68             | mov                 dword ptr [esp + 0x50], eax
            //   0fb78394000000       | inc                 ebp
            //   66890451             | xor                 ecx, ecx
            //   8383a0000000ff       | dec                 eax
            //   7597                 | mov                 eax, dword ptr [ecx + 8]
            //   ff8394000000         | dec                 eax
            //   448b8394000000       | mov                 ecx, dword ptr [esp + 0x48]

        $sequence_4 = { 488b4c2468 ff15???????? 8b8fa0390100 48899ccf20010000 ff87a0390100 488b9c2480000000 4883c470 }
            // n = 7, score = 300
            //   488b4c2468           | mov                 dword ptr [ebx + 0x38], eax
            //   ff15????????         |                     
            //   8b8fa0390100         | dec                 eax
            //   48899ccf20010000     | test                eax, eax
            //   ff87a0390100         | dec                 eax
            //   488b9c2480000000     | mov                 ecx, dword ptr [esp + 0x68]
            //   4883c470             | mov                 ecx, dword ptr [edi + 0x139a0]

        $sequence_5 = { 488b4d40 ff5530 48894338 4885c0 }
            // n = 4, score = 300
            //   488b4d40             | dec                 eax
            //   ff5530               | mov                 ecx, dword ptr [ebp + 0x40]
            //   48894338             | call                dword ptr [ebp + 0x30]
            //   4885c0               | dec                 eax

        $sequence_6 = { 8b35???????? 85f6 7420 6bc618 57 8db8d0264400 }
            // n = 6, score = 300
            //   8b35????????         |                     
            //   85f6                 | push                eax
            //   7420                 | add                 esp, 0xc
            //   6bc618               | lea                 eax, [ebp - 0x154]
            //   57                   | push                eax
            //   8db8d0264400         | lea                 eax, [ebp - 0x25c]

        $sequence_7 = { 488b4c2448 83caff 488bd8 ff15???????? 488b4c2448 eb6c 488d0513fdffff }
            // n = 7, score = 300
            //   488b4c2448           | lea                 edx, [ebp + 0x2e0]
            //   83caff               | inc                 ebp
            //   488bd8               | mov                 eax, ebp
            //   ff15????????         |                     
            //   488b4c2448           | dec                 eax
            //   eb6c                 | mov                 ecx, dword ptr [esp + 0x48]
            //   488d0513fdffff       | call                dword ptr [esp + 0x50]

        $sequence_8 = { 8b35???????? 8d8d7cf6ffff e8???????? 8d8580fcffff }
            // n = 4, score = 300
            //   8b35????????         |                     
            //   8d8d7cf6ffff         | shl                 bl, 4
            //   e8????????           |                     
            //   8d8580fcffff         | movzx               eax, bl

        $sequence_9 = { 8b35???????? 8d858cfeffff 83c40c 50 }
            // n = 4, score = 300
            //   8b35????????         |                     
            //   8d858cfeffff         | movzx               eax, bl
            //   83c40c               | push                eax
            //   50                   | push                eax

        $sequence_10 = { 8b35???????? 68???????? 53 ffd6 8945cc }
            // n = 5, score = 300
            //   8b35????????         |                     
            //   68????????           |                     
            //   53                   | add                 dword ptr [edi + 0x84], 5
            //   ffd6                 | jmp                 dword ptr [eax*4 + 0x418d60]
            //   8945cc               | push                0x40c

        $sequence_11 = { 488b4c2440 ff15???????? 90 488d8c2460010000 e8???????? 8bc3 488b9c24d0020000 }
            // n = 7, score = 300
            //   488b4c2440           | mov                 eax, ebp
            //   ff15????????         |                     
            //   90                   | dec                 eax
            //   488d8c2460010000     | mov                 ecx, dword ptr [esp + 0x48]
            //   e8????????           |                     
            //   8bc3                 | call                dword ptr [esp + 0x50]
            //   488b9c24d0020000     | dec                 eax

        $sequence_12 = { 8b35???????? ffd6 57 ffd6 8b45ec }
            // n = 5, score = 300
            //   8b35????????         |                     
            //   ffd6                 | shl                 bl, 4
            //   57                   | movzx               eax, bl
            //   ffd6                 | push                eax
            //   8b45ec               | add                 esp, 0xc

        $sequence_13 = { 488b4c2468 83caff 488bd8 ff15???????? 488b4c2468 ff15???????? 8b8fa0390100 }
            // n = 7, score = 300
            //   488b4c2468           | inc                 dword ptr [edi + 0x139a0]
            //   83caff               | dec                 eax
            //   488bd8               | mov                 ebx, dword ptr [esp + 0x80]
            //   ff15????????         |                     
            //   488b4c2468           | dec                 eax
            //   ff15????????         |                     
            //   8b8fa0390100         | mov                 ecx, dword ptr [esp + 0x68]

        $sequence_14 = { 8b35???????? 53 ffd6 ffb550f7ffff ffd6 8b35???????? }
            // n = 6, score = 300
            //   8b35????????         |                     
            //   53                   | mov                 dword ptr [ebp - 4], 0
            //   ffd6                 | lea                 ecx, [edi + 1]
            //   ffb550f7ffff         | mov                 al, byte ptr [edi]
            //   ffd6                 | mov                 esi, edi
            //   8b35????????         |                     

        $sequence_15 = { 488b4c2448 eb6c 488d0513fdffff c644246000 4889442450 4533c9 488b4108 }
            // n = 7, score = 300
            //   488b4c2448           | dec                 eax
            //   eb6c                 | mov                 ecx, dword ptr [esp + 0x68]
            //   488d0513fdffff       | or                  edx, 0xffffffff
            //   c644246000           | dec                 eax
            //   4889442450           | mov                 ebx, eax
            //   4533c9               | dec                 eax
            //   488b4108             | mov                 ecx, dword ptr [esp + 0x48]

        $sequence_16 = { e8???????? 8b4f14 8bf0 83ce07 894dec }
            // n = 5, score = 100
            //   e8????????           |                     
            //   8b4f14               | mov                 ecx, dword ptr [edi + 0x14]
            //   8bf0                 | mov                 esi, eax
            //   83ce07               | or                  esi, 7
            //   894dec               | mov                 dword ptr [ebp - 0x14], ecx

        $sequence_17 = { ff15???????? 8d85f4fdffff 50 8d85d8fbffff 68???????? 50 ff15???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8d85f4fdffff         | lea                 eax, [ebp - 0x20c]
            //   50                   | push                eax
            //   8d85d8fbffff         | lea                 eax, [ebp - 0x428]
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_18 = { 5e 5b 8be5 5d c20400 80bdd8feffff2e }
            // n = 6, score = 100
            //   5e                   | inc                 dword ptr [ebx + 0x94]
            //   5b                   | dec                 eax
            //   8be5                 | mov                 ecx, dword ptr [ebx + 0x68]
            //   5d                   | movzx               eax, word ptr [ebx + 0x94]
            //   c20400               | mov                 word ptr [ecx + edx*2], ax
            //   80bdd8feffff2e       | add                 dword ptr [ebx + 0xa0], -1

        $sequence_19 = { 75f9 8dbd70feffff 2bd6 4f }
            // n = 4, score = 100
            //   75f9                 | mov                 ecx, ecx
            //   8dbd70feffff         | inc                 bp
            //   2bd6                 | mov                 dword ptr [ecx + 0x1710], edx
            //   4f                   | add                 esp, 0xc

        $sequence_20 = { e8???????? 83c40c 6b45e430 8945e0 8d8068604100 }
            // n = 5, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6b45e430             | imul                eax, dword ptr [ebp - 0x1c], 0x30
            //   8945e0               | mov                 dword ptr [ebp - 0x20], eax
            //   8d8068604100         | lea                 eax, [eax + 0x416068]

        $sequence_21 = { 6a00 ff750c 6a20 ff7508 e8???????? ff7004 }
            // n = 6, score = 100
            //   6a00                 | sub                 esi, edx
            //   ff750c               | cmp                 ebp, esi
            //   6a20                 | inc                 ecx
            //   ff7508               | inc                 dword ptr [ecx + 0x28]
            //   e8????????           |                     
            //   ff7004               | inc                 ecx

        $sequence_22 = { 6bd030 895de4 8b049d30744100 8945d4 8955e8 8a5c1029 80fb02 }
            // n = 7, score = 100
            //   6bd030               | imul                edx, eax, 0x30
            //   895de4               | mov                 dword ptr [ebp - 0x1c], ebx
            //   8b049d30744100       | mov                 eax, dword ptr [ebx*4 + 0x417430]
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   8955e8               | mov                 dword ptr [ebp - 0x18], edx
            //   8a5c1029             | mov                 bl, byte ptr [eax + edx + 0x29]
            //   80fb02               | cmp                 bl, 2

        $sequence_23 = { 8bf7 8b86b4000000 8901 8a86b8000000 884104 8d878c000000 83878400000005 }
            // n = 7, score = 100
            //   8bf7                 | inc                 esp
            //   8b86b4000000         | and                 ecx, dword ptr [ebx + 0x7c]
            //   8901                 | inc                 esp
            //   8a86b8000000         | mov                 dword ptr [ebx + 0x70], ecx
            //   884104               | dec                 ebp
            //   8d878c000000         | and                 eax, edx
            //   83878400000005       | inc                 edx

        $sequence_24 = { 6bf630 8b0c8d30744100 80643128fd 5f 5e }
            // n = 5, score = 100
            //   6bf630               | imul                esi, esi, 0x30
            //   8b0c8d30744100       | mov                 ecx, dword ptr [ecx*4 + 0x417430]
            //   80643128fd           | and                 byte ptr [ecx + esi + 0x28], 0xfd
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_25 = { 0f8483000000 eb7d 8b1c9dc4f24000 6800080000 6a00 53 ff15???????? }
            // n = 7, score = 100
            //   0f8483000000         | je                  0x89
            //   eb7d                 | jmp                 0x7f
            //   8b1c9dc4f24000       | mov                 ebx, dword ptr [ebx*4 + 0x40f2c4]
            //   6800080000           | push                0x800
            //   6a00                 | push                0
            //   53                   | push                ebx
            //   ff15????????         |                     

        $sequence_26 = { ff15???????? 56 ff15???????? 8d7b18 c745fc00000000 8d4f01 8a07 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   56                   | jne                 0xffffffab
            //   ff15????????         |                     
            //   8d7b18               | dec                 eax
            //   c745fc00000000       | mov                 ecx, dword ptr [ebx + 0x60]
            //   8d4f01               | inc                 esp
            //   8a07                 | xor                 ecx, eax

        $sequence_27 = { 7517 57 ff15???????? 5e }
            // n = 4, score = 100
            //   7517                 | jne                 0x19
            //   57                   | push                edi
            //   ff15????????         |                     
            //   5e                   | pop                 esi

        $sequence_28 = { ff2485608d4100 680c040000 33db e8???????? 8bf8 83c404 }
            // n = 6, score = 100
            //   ff2485608d4100       | movzx               eax, word ptr [edx + ecx*2]
            //   680c040000           | inc                 dx
            //   33db                 | mov                 dword ptr [ecx + eax*2], eax
            //   e8????????           |                     
            //   8bf8                 | add                 dword ptr [ebx + 0x14], eax
            //   83c404               | mov                 esi, edi

        $sequence_29 = { 0f82e0000000 8b7d10 2bc1 3bc7 0f42f8 3bf3 7549 }
            // n = 7, score = 100
            //   0f82e0000000         | jb                  0xe6
            //   8b7d10               | mov                 edi, dword ptr [ebp + 0x10]
            //   2bc1                 | sub                 eax, ecx
            //   3bc7                 | cmp                 eax, edi
            //   0f42f8               | cmovb               edi, eax
            //   3bf3                 | cmp                 esi, ebx
            //   7549                 | jne                 0x4b

    condition:
        7 of them and filesize < 606208
}