rule win_lowkey_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.lowkey."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.lowkey"
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
        $sequence_0 = { 4889442428 488d442460 4889442420 41b802000000 488b5310 488b0d???????? 488b8900040000 }
            // n = 7, score = 100
            //   4889442428           | mov                 edi, ebx
            //   488d442460           | dec                 eax
            //   4889442420           | lea                 ecx, [ebp + 0x170]
            //   41b802000000         | mov                 ecx, 0x1388
            //   488b5310             | dec                 eax
            //   488b0d????????       |                     
            //   488b8900040000       | lea                 edx, [0x224b0]

        $sequence_1 = { 33d2 488bc8 ff15???????? 488d1556260200 488d8d70010000 ff15???????? 85c0 }
            // n = 7, score = 100
            //   33d2                 | dec                 eax
            //   488bc8               | lea                 ecx, [esp + 0x60]
            //   ff15????????         |                     
            //   488d1556260200       | or                  edx, 0xffffffff
            //   488d8d70010000       | call                dword ptr [eax + 0x20]
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax

        $sequence_2 = { e9???????? 488d15fa230200 488d8d70010000 ff15???????? 85c0 7563 488d4c2470 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   488d15fa230200       | inc                 ebp
            //   488d8d70010000       | xor                 ecx, ecx
            //   ff15????????         |                     
            //   85c0                 | dec                 eax
            //   7563                 | mov                 dword ptr [esp + 0xd0], eax
            //   488d4c2470           | inc                 ebp

        $sequence_3 = { 69cabc020000 442bc1 4181c058020000 41c1e014 4489442420 488bd3 e8???????? }
            // n = 7, score = 100
            //   69cabc020000         | push                edi
            //   442bc1               | dec                 eax
            //   4181c058020000       | sub                 esp, 0x20
            //   41c1e014             | inc                 ecx
            //   4489442420           | mov                 ebp, eax
            //   488bd3               | dec                 esp
            //   e8????????           |                     

        $sequence_4 = { 7408 8b442430 8bc8 cd29 488d0d332d0400 e8???????? 488b442428 }
            // n = 7, score = 100
            //   7408                 | mov                 ebp, edx
            //   8b442430             | mov                 ebx, esi
            //   8bc8                 | dec                 eax
            //   cd29                 | mov                 edi, ecx
            //   488d0d332d0400       | dec                 eax
            //   e8????????           |                     
            //   488b442428           | mov                 dword ptr [esp + 0x18], esi

        $sequence_5 = { 0f8444040000 448b442440 488d542450 e8???????? 488bcb e8???????? 8b5c2440 }
            // n = 7, score = 100
            //   0f8444040000         | dec                 eax
            //   448b442440           | xor                 eax, esp
            //   488d542450           | dec                 eax
            //   e8????????           |                     
            //   488bcb               | lea                 ebp, [esp - 0x4660]
            //   e8????????           |                     
            //   8b5c2440             | mov                 eax, 0x4760

        $sequence_6 = { 4053 56 57 4881ecc0010000 488b05???????? 4833c4 48898424b0010000 }
            // n = 7, score = 100
            //   4053                 | dec                 eax
            //   56                   | lea                 edx, [0x201fd]
            //   57                   | xor                 ecx, ecx
            //   4881ecc0010000       | test                eax, eax
            //   488b05????????       |                     
            //   4833c4               | je                  0xf00
            //   48898424b0010000     | dec                 eax

        $sequence_7 = { ff15???????? 4c8d4530 66897dad 488d55a8 8d044502000000 8945b0 e8???????? }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   4c8d4530             | lea                 eax, [ebp + 0x970]
            //   66897dad             | dec                 eax
            //   488d55a8             | lea                 edx, [esp + 0x30]
            //   8d044502000000       | mov                 dword ptr [esp + 0x38], eax
            //   8945b0               | mov                 word ptr [esp + 0x3d], ax
            //   e8????????           |                     

        $sequence_8 = { 488bcb ff15???????? 48897c2430 4c897c2420 }
            // n = 4, score = 100
            //   488bcb               | cmp                 eax, ecx
            //   ff15????????         |                     
            //   48897c2430           | jne                 0xec3
            //   4c897c2420           | dec                 eax

        $sequence_9 = { 895c2450 4d8943d0 448d4302 45894bd8 6641b90100 49894398 ff15???????? }
            // n = 7, score = 100
            //   895c2450             | dec                 eax
            //   4d8943d0             | mov                 dword ptr [esp + 0x28], ecx
            //   448d4302             | mov                 dword ptr [esp + 0x20], edx
            //   45894bd8             | dec                 esp
            //   6641b90100           | lea                 ecx, [0xfffea09a]
            //   49894398             | dec                 esp
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 643072
}