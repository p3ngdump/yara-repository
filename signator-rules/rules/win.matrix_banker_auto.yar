rule win_matrix_banker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.matrix_banker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.matrix_banker"
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
        $sequence_0 = { ff15???????? e8???????? 85c0 740a e8???????? 83f8ff }
            // n = 6, score = 900
            //   ff15????????         |                     
            //   e8????????           |                     
            //   85c0                 | mov                 eax, dword ptr [ecx + 0x10]
            //   740a                 | call                eax
            //   e8????????           |                     
            //   83f8ff               | jne                 0xdf7

        $sequence_1 = { 80f905 7702 04c9 8d4ad0 80f909 }
            // n = 5, score = 900
            //   80f905               | dec                 esp
            //   7702                 | lea                 esp, [0x14be4]
            //   04c9                 | and                 eax, 0x1f
            //   8d4ad0               | dec                 eax
            //   80f909               | mov                 eax, ebx

        $sequence_2 = { 721e 8125????????fffdffff 8125????????fffdffff 8125????????fffdffff }
            // n = 4, score = 900
            //   721e                 | dec                 eax
            //   8125????????fffdffff     |     
            //   8125????????fffdffff     |     
            //   8125????????fffdffff     |     

        $sequence_3 = { 80f905 7704 04a9 eb0a 8d48bf 80f905 }
            // n = 6, score = 900
            //   80f905               | mov                 edi, eax
            //   7704                 | dec                 eax
            //   04a9                 | mov                 ebx, edx
            //   eb0a                 | dec                 esp
            //   8d48bf               | lea                 ecx, [esp + 0x28]
            //   80f905               | dec                 eax

        $sequence_4 = { 7704 04a9 eb0a 8d48bf 80f905 7702 }
            // n = 6, score = 900
            //   7704                 | dec                 eax
            //   04a9                 | mov                 dword ptr [eax + 0xc], ebp
            //   eb0a                 | inc                 ecx
            //   8d48bf               | mov                 ecx, dword ptr [ebp]
            //   80f905               | dec                 esp
            //   7702                 | mov                 eax, esi

        $sequence_5 = { 66890d???????? 66030d???????? 66890d???????? e8???????? }
            // n = 4, score = 900
            //   66890d????????       |                     
            //   66030d????????       |                     
            //   66890d????????       |                     
            //   e8????????           |                     

        $sequence_6 = { 04a9 eb0a 8d48bf 80f905 7702 }
            // n = 5, score = 900
            //   04a9                 | push                eax
            //   eb0a                 | lea                 eax, [ebp - 0xc]
            //   8d48bf               | mov                 dword ptr [ebp - 0xc], 0x4cac2d8
            //   80f905               | push                eax
            //   7702                 | lea                 eax, [ebp - 0xc]

        $sequence_7 = { 04a9 eb0a 8d48bf 80f905 }
            // n = 4, score = 900
            //   04a9                 | add                 al, 0x5c
            //   eb0a                 | add                 al, 0x4c
            //   8d48bf               | out                 0xb2, al
            //   80f905               | add                 al, 0x23

        $sequence_8 = { 80f905 7705 80c2a9 eb0b 8d4abf 80f905 }
            // n = 6, score = 900
            //   80f905               | mov                 dword ptr [esp + 0x30], eax
            //   7705                 | dec                 eax
            //   80c2a9               | mov                 eax, dword ptr [ecx + 0x38]
            //   eb0b                 | dec                 eax
            //   8d4abf               | mov                 ebx, ecx
            //   80f905               | dec                 eax

        $sequence_9 = { eb18 8d4a9f 80f905 7705 }
            // n = 4, score = 900
            //   eb18                 | lea                 eax, [ebx + esi]
            //   8d4a9f               | inc                 ecx
            //   80f905               | add                 eax, ecx
            //   7705                 | mov                 ecx, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 422912
}