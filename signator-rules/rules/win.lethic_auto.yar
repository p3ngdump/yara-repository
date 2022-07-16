rule win_lethic_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.lethic."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lethic"
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
        $sequence_0 = { 3b4df4 741e 8b55fc 8b45f8 }
            // n = 4, score = 1200
            //   3b4df4               | cmp                 ecx, dword ptr [ebp - 0xc]
            //   741e                 | je                  0x20
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]

        $sequence_1 = { e9???????? 8b45fc 8b4d10 894804 8b55fc c7823410000001000000 }
            // n = 6, score = 1200
            //   e9????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   894804               | mov                 dword ptr [eax + 4], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   c7823410000001000000     | mov    dword ptr [edx + 0x1034], 1

        $sequence_2 = { 8945fc 8b4dfc 034d0c 894df8 8b55fc 3b55f8 7411 }
            // n = 7, score = 1200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   034d0c               | add                 ecx, dword ptr [ebp + 0xc]
            //   894df8               | mov                 dword ptr [ebp - 8], ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   3b55f8               | cmp                 edx, dword ptr [ebp - 8]
            //   7411                 | je                  0x13

        $sequence_3 = { 7418 8b45f8 50 8b4dfc 51 8b55fc }
            // n = 6, score = 1200
            //   7418                 | je                  0x1a
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   50                   | push                eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]

        $sequence_4 = { 8945fc 8b4dfc 894df0 8b550c 8955f8 8b45f8 034510 }
            // n = 7, score = 1200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx
            //   8b550c               | mov                 edx, dword ptr [ebp + 0xc]
            //   8955f8               | mov                 dword ptr [ebp - 8], edx
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   034510               | add                 eax, dword ptr [ebp + 0x10]

        $sequence_5 = { 8b55fc 837a18ff 7420 8d45f8 }
            // n = 4, score = 1200
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   837a18ff             | cmp                 dword ptr [edx + 0x18], -1
            //   7420                 | je                  0x22
            //   8d45f8               | lea                 eax, [ebp - 8]

        $sequence_6 = { 8b45fc 8b08 894dfc ebec 8b55fc 8b45f4 }
            // n = 6, score = 1200
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   894dfc               | mov                 dword ptr [ebp - 4], ecx
            //   ebec                 | jmp                 0xffffffee
            //   8b55fc               | mov                 edx, dword ptr [ebp - 4]
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

        $sequence_7 = { 50 687e660480 8b4dfc 8b5118 52 8b45f4 }
            // n = 6, score = 1200
            //   50                   | push                eax
            //   687e660480           | push                0x8004667e
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   8b5118               | mov                 edx, dword ptr [ecx + 0x18]
            //   52                   | push                edx
            //   8b45f4               | mov                 eax, dword ptr [ebp - 0xc]

        $sequence_8 = { 3b55f8 7411 8b45fc c60000 8b4dfc 83c101 }
            // n = 6, score = 1200
            //   3b55f8               | cmp                 edx, dword ptr [ebp - 8]
            //   7411                 | je                  0x13
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]
            //   c60000               | mov                 byte ptr [eax], 0
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   83c101               | add                 ecx, 1

        $sequence_9 = { ffd1 33c0 eb42 6a10 }
            // n = 4, score = 1200
            //   ffd1                 | call                ecx
            //   33c0                 | xor                 eax, eax
            //   eb42                 | jmp                 0x44
            //   6a10                 | push                0x10

    condition:
        7 of them and filesize < 81920
}