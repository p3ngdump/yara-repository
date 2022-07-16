rule win_moriagent_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.moriagent."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.moriagent"
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
        $sequence_0 = { eb0c b802000000 eb05 b801000000 33ff }
            // n = 5, score = 200
            //   eb0c                 | jmp                 0xe
            //   b802000000           | mov                 eax, 2
            //   eb05                 | jmp                 7
            //   b801000000           | mov                 eax, 1
            //   33ff                 | xor                 edi, edi

        $sequence_1 = { 741c 8bc8 83e901 0f84db000000 83e901 7536 }
            // n = 6, score = 100
            //   741c                 | je                  0x1e
            //   8bc8                 | mov                 ecx, eax
            //   83e901               | sub                 ecx, 1
            //   0f84db000000         | je                  0xe1
            //   83e901               | sub                 ecx, 1
            //   7536                 | jne                 0x38

        $sequence_2 = { 90 f6c304 7410 83e3fb }
            // n = 4, score = 100
            //   90                   | test                bl, 2
            //   f6c304               | je                  0xe
            //   7410                 | dec                 eax
            //   83e3fb               | lea                 ecx, [ebp - 0x60]

        $sequence_3 = { e8???????? 8b8de0eeffff 8bb5d4eeffff 89b534efffff }
            // n = 4, score = 100
            //   e8????????           |                     
            //   8b8de0eeffff         | mov                 ecx, dword ptr [ebp - 0x1120]
            //   8bb5d4eeffff         | mov                 esi, dword ptr [ebp - 0x112c]
            //   89b534efffff         | mov                 dword ptr [ebp - 0x10cc], esi

        $sequence_4 = { 90 f6c310 740d 83e3ef }
            // n = 4, score = 100
            //   90                   | test                bl, 4
            //   f6c310               | je                  0x12
            //   740d                 | and                 ebx, 0xfffffffb
            //   83e3ef               | dec                 eax

        $sequence_5 = { 90 f683d800000002 752a 48397360 7424 b20a 488b4b08 }
            // n = 7, score = 100
            //   90                   | nop                 
            //   f683d800000002       | test                byte ptr [ebx + 0xd8], 2
            //   752a                 | jne                 0x2c
            //   48397360             | dec                 eax
            //   7424                 | cmp                 dword ptr [ebx + 0x60], esi
            //   b20a                 | je                  0x26
            //   488b4b08             | mov                 dl, 0xa

        $sequence_6 = { ff15???????? 8bf0 897704 8b551c 83fa10 }
            // n = 5, score = 100
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   897704               | mov                 dword ptr [edi + 4], esi
            //   8b551c               | mov                 edx, dword ptr [ebp + 0x1c]
            //   83fa10               | cmp                 edx, 0x10

        $sequence_7 = { 90 f6c320 7410 83e3df }
            // n = 4, score = 100
            //   90                   | lea                 ecx, [ebp + 0xe0]
            //   f6c320               | nop                 
            //   7410                 | test                bl, 4
            //   83e3df               | je                  0x15

        $sequence_8 = { 90 f683d800000002 752e 48397360 }
            // n = 4, score = 100
            //   90                   | dec                 eax
            //   f683d800000002       | mov                 ecx, dword ptr [ebx + 8]
            //   752e                 | nop                 
            //   48397360             | test                byte ptr [ebx + 0xd8], 2

        $sequence_9 = { 6a40 ff15???????? 8bf0 8933 85f6 }
            // n = 5, score = 100
            //   6a40                 | push                0x40
            //   ff15????????         |                     
            //   8bf0                 | mov                 esi, eax
            //   8933                 | mov                 dword ptr [ebx], esi
            //   85f6                 | test                esi, esi

        $sequence_10 = { 90 f6c302 7409 488d4da0 }
            // n = 4, score = 100
            //   90                   | test                byte ptr [ebx + 0xd8], 2
            //   f6c302               | jne                 0x30
            //   7409                 | dec                 eax
            //   488d4da0             | cmp                 dword ptr [ebx + 0x60], esi

        $sequence_11 = { 83c40c 3bb5e4eeffff 0f850ff8ffff 8bb5e4eeffff 6a00 6800100000 8d85f0efffff }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   3bb5e4eeffff         | cmp                 esi, dword ptr [ebp - 0x111c]
            //   0f850ff8ffff         | jne                 0xfffff815
            //   8bb5e4eeffff         | mov                 esi, dword ptr [ebp - 0x111c]
            //   6a00                 | push                0
            //   6800100000           | push                0x1000
            //   8d85f0efffff         | lea                 eax, [ebp - 0x1010]

        $sequence_12 = { 8d442408 8974240c c744241407000000 c744241801800000 50 6a02 }
            // n = 6, score = 100
            //   8d442408             | lea                 eax, [esp + 8]
            //   8974240c             | mov                 dword ptr [esp + 0xc], esi
            //   c744241407000000     | mov                 dword ptr [esp + 0x14], 7
            //   c744241801800000     | mov                 dword ptr [esp + 0x18], 0x8001
            //   50                   | push                eax
            //   6a02                 | push                2

        $sequence_13 = { 83f81f 0f8780120000 52 51 e8???????? }
            // n = 5, score = 100
            //   83f81f               | cmp                 eax, 0x1f
            //   0f8780120000         | ja                  0x1286
            //   52                   | push                edx
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_14 = { 94 c0c348 8b4110 488b4878 }
            // n = 4, score = 100
            //   94                   | je                  0x15
            //   c0c348               | and                 ebx, 0xffffffdf
            //   8b4110               | nop                 
            //   488b4878             | test                bl, 0x20

    condition:
        7 of them and filesize < 1347904
}